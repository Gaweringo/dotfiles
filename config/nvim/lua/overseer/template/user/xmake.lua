local TAG = require('overseer.constants').TAG
local overseer = require('overseer')
local files = require('overseer.files')

---@param opts overseer.SearchParams
---@return nil|string
local function get_xmake_file(opts)
  return vim.fs.find('xmake.lua', { upward = true, path = opts.dir })[1]
end

local tmpl_run = {
  name = 'xmake run',
  tags = { TAG.RUN },
  params = {
    target = { optional = true, type = 'string', desc = 'The target to run' },
    target_args = { optional = true, type = 'list', delimiter = ' ', desc = 'Arguments passed to the target' },
  },
  builder = function(params)
    local args = { 'run' }
    if params.target then
      vim.list_extend(args, { params.target })
    end
    if params.target_args then
      vim.list_extend(args, params.target_args)
    end
    return {
      cmd = 'xmake',
      args = args,
      components = { 'default' },
    }
  end,
}

local tmpl_build = {
  name = 'xmake build',
  params = { args = { optional = true, type = 'list', delimiter = " " } },
  tags = { TAG.BUILD },
  builder = function(params)
    -- https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks
    local args = {}
    vim.list_extend(args, params.args)
    return {
      cmd = 'xmake',
      args = args,
      -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#on_output_quickfix
      components = {
        { 'on_output_quickfix', open = true, close = true, set_diagnostics = true },
        'on_exit_set_status',
        'default',
        -- 'on_result_diagnostics_trouble'
      },
      -- NOTE: Maybe needed?
      env = {
        XMAKE_COLORTERM = 'nocolor',
      },
    }
  end,
  condition = {
    callback = function(opts)
      -- Make sure the 'xmake.lua' file exists in the cwd
      return get_xmake_file(opts) ~= nil;
    end,
  },
}

---@type overseer.TemplateFileProvider
local provider = {
  cache_key = function(opts)
    return get_xmake_file(opts)
  end,
  condition = {
    callback = function(opts)
      if vim.fn.executable('xmake') == 0 then
        return false, 'Command "xmake" not found'
      end
      if not get_xmake_file(opts) then
        return false, 'No "xmake.lua" file founc'
      end
      return true
    end,
  },
  generator = function(opts, cb)
    local file = assert(get_xmake_file(opts))
    local content = assert(files.read_file(file))
    local targets = {}
    for line in vim.gsplit(content, "\n") do
      -- Find call to target function
      local target = line:match("target%s-%(?%s*['\"](.*)['\"]")
      if target ~= nil then
        targets[target] = true
      end
    end

    local ret = { tmpl_run, tmpl_build }
    for target in pairs(targets) do
      table.insert(
        ret,
        overseer.wrap_template(
          tmpl_build,
          { name = string.format('xmake build %s', target) },
          { args = { 'build', target } }
        )
      )
      table.insert(
        ret,
        overseer.wrap_template(
          tmpl_run,
          { name = string.format('xmake run %s', target) },
          { target = target }
        )
      )
    end

    cb(ret)
  end,
}

return provider
