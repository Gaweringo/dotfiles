local function find_buildzig(path, opts)
  opts = opts or { limit = 1 }
  return vim.fs.find('build.zig', { upward = true, type = 'file', path = path, limit = opts.limit })
end

---@type overseer.TemplateFileProvider
local tmpl = {
  condition = {
    callback = function(opts)
      return not vim.tbl_isempty(find_buildzig(opts.dir))
    end,
  },
  cache_key = function(opts)
    return find_buildzig(opts.dir)[1]
  end,
  generator = function(opts, cb)
    if vim.fn.executable 'zig' == 0 then
      return 'Command "zig" not found'
    end

    -- Need to normalize, as opts.dir has a trailing slash at the end, which somehow results in
    -- vim.fs.find giving us the same file twice
    local candidates = find_buildzig(vim.fs.normalize(opts.dir), { limit = math.huge })
    if vim.tbl_isempty(candidates) then
      return 'No build.zig found'
    end

    for _, buildzig in ipairs(candidates) do
      local cwd = vim.fs.dirname(buildzig)
      vim.system(
        { 'zig', 'build', '--list-steps' },
        { cwd = cwd, text = true },
        vim.schedule_wrap(function(out)
          local testcases = vim.split(out.stdout, '\n', { trimempty = true })
          ---@type overseer.TemplateDefinition[]
          local ret = {}
          for _, testcase in ipairs(testcases) do
            -- Output from zig build --list-steps looks like:
            --    install (default)       Install to prefix
            --    uninstall               Uninstall
            local default = (string.find(testcase, '%S+ %(default%)') and ' %(default%)') or ''
            local name, desc = string.match(testcase, '(%S+)' .. default .. '%s+(.*)')
            table.insert(ret, {
              name = 'zig build ' .. name,
              desc = desc,
              builder = function()
                return {
                  cmd = { 'zig', 'build', name },
                  cwd = cwd,
                }
              end,
            })
          end

          cb(ret)
        end)
      )
    end
  end,
}

return tmpl
