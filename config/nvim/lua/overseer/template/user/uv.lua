local TAG = require('overseer.constants').TAG
local overseer = require('overseer')

local function find_python_files(start_path)
    return vim.fs.find(function(name, path)
        return name:match('.*%.py$') and not path:match('%.venv')
    end, { type = 'file', limit = math.huge, path = start_path })
end

---@param opts overseer.SearchParams
---@return nil|string
local function get_pyproject_file(opts)
    local pyproject = vim.fs.find({ 'pyproject.toml' }, { type = 'file', upward = true, path = opts.dir })[1]
    return pyproject
end

---@type overseer.TemplateFileDefinition
local uv_run_tmpl = {
    name = 'uv run',
    tags = { TAG.RUN },
    params = {
        target = { optional = false, type = 'string', desc = 'The script or command to run' },
        target_args = { optional = true, type = 'list', delimiter = ' ', desc = 'Arguments passed to the command' },
    },
    builder = function(opts)
        local args = { 'run' }
        vim.list_extend(args, { opts.target })
        return {
            cmd = 'uv',
            args = args,
            components = {
                'on_complete_notify',
                'on_exit_set_status',
                'default',
            },
        }
    end,
    condition = {
        filetype = { 'python' },
        callback = function(search)
            -- Make sure the 'run.py' file exists in the cwd
            return get_pyproject_file(search) ~= nil
        end,
    },
}

---@type overseer.TemplateFileProvider
return {
    generator = function(opts, cb)
        local pyproject = assert(get_pyproject_file(opts))
        local py_files = find_python_files(vim.fn.fnamemodify(pyproject, ":p:h"))
        local ret = { uv_run_tmpl }
        for _, target in ipairs(py_files) do
            local relative_target =vim.fn.fnamemodify(target, ":.")
            table.insert(
                ret,
                overseer.wrap_template(
                    uv_run_tmpl,
                    { name = string.format('uv run %s', relative_target) },
                    { target = relative_target }
                )
            )
        end
        cb(ret)
    end,
    condition = {
        callback = function(search)
            -- Make sure the 'run.py' file exists in the cwd
            return get_pyproject_file(search) ~= nil
        end,
    },
}
