local TAG = require('overseer.constants').TAG
local overseer = require('overseer')

local nvc_errorformat = [[%E** Error: %m,]] -- Error message (multiline)
        .. [[%W** Warning: %m,]]            -- Warning message (multiline)
        .. [[%C%*[\ ]> %f:%l,]]             -- A line, with space before > and then filename and column
        -- NOTE: This matches on the first line with the ^^^^, but some errors have multiple ^^^ lines, with the later
        -- ones pointing to the right column
        .. [[%-C%.%#| %p^%.%#,]]           -- Find the column, by counting spaces before the ^, and end multiline parsing
        .. [[%Z%*[|],]]                     -- Stop if the line doesn't have | in it anymore
        .. [[%-C%.%#,]]                     -- If none of the above patterns match, continue matching any line

local function findVunitDir()
    local vunit_dir = vim.fs.find({ 'vunit' }, { type = 'directory', upward = true })[1]
    if vunit_dir == nil then
        vunit_dir = vim.fs.find({ 'vunit' }, { type = 'directory' })[1]
    end
    return vunit_dir
end

local function vunit_get_testcases(use_uv, cwd)
    local command = { 'python' }
    if use_uv then
        command = { 'uv', 'run', '-q' }
    end
    vim.list_extend(command, { 'run.py', '--list' })
    local obj = vim.system(command, { cwd = cwd }):wait()
    vim.print(obj)
    local testcases = vim.split(obj.stdout, '\r?\n', { trimempty = true })
    table.remove(testcases) -- remove last line (not a testcase)
    return testcases
end

---@type overseer.TemplateFileDefinition
local vunit_test_tmpl = {
    name = 'vunit test',
    tags = { TAG.TEST },
    params = {
        testcase = { optional = true, type = 'string', desc = 'The testcase to run' },
        gui = { optional = true, type = 'boolean', desc = 'Run test case in gui', default = false },
        cwd = { optional = true, type = 'string', desc = 'Directory of vunit run.py file', default = findVunitDir() },
        parallel = { optional = true, type = 'integer', desc = 'How many testcases to run in parallel', default = #vim.uv.cpu_info() }
    },
    builder = function(params)
        -- https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks
        local uses_uv = vim.fs.find('pyproject.toml', { dir = params.cwd }) ~= nil

        local cmd = 'python'
        if uses_uv then
            cmd = 'uv'
        end

        if params.testcase ~= nil then
            params.testcase =  "'" .. params.testcase .. "'"
        end

        local args = { 'run.py', params.testcase, '-p', tostring(params.parallel) }
        if uses_uv then
            -- prepend run -q
            table.insert(args, 1, '-q')
            table.insert(args, 1, 'run')
        end

        if params.gui then
            table.insert(args, '--gui')
        end

        return {
            cmd = cmd,
            args = args,
            cwd = params.cwd,
            -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#on_output_quickfix
            components = {
                { 'on_output_quickfix', errorformat = nvc_errorformat, open_on_match = true, set_diagnostics = true },
                'on_result_diagnostics',
                'on_complete_notify',
                'on_exit_set_status',
                'default',
            },
        }
    end,
    condition = {
        filetype = { 'vhdl', 'python' },
        callback = function(search)
            -- Make sure the 'run.py' file exists in the cwd
            return findVunitDir() ~= nil
        end,
    },
}

---@type overseer.TemplateFileProvider
return {
    generator = function(opts, cb)
        local vunit_dir = findVunitDir() or '.'
        local ret = { overseer.wrap_template(vunit_test_tmpl, { name = 'vunit test' }, { cwd = vunit_dir }) }
        local uses_uv = vim.fs.find('pyproject.toml', { dir = vunit_dir }) ~= nil
        local testcases = vunit_get_testcases(uses_uv, vunit_dir)

        for _, testcase in ipairs(testcases) do
            table.insert(
                ret,
                overseer.wrap_template(
                    vunit_test_tmpl,
                    { name = string.format('vunit test \'%s\'', testcase) },
                    { testcase = testcase }
                )
            )
        end

        cb(ret)
    end,
    condition = {
        filetype = { 'vhdl', 'python' },
        callback = function(search)
            -- Make sure the 'run.py' file exists in the cwd
            return findVunitDir() ~= nil
        end,
    },
    --  TODO: Set up caching correctly
}
