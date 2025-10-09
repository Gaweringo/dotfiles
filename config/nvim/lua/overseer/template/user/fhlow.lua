local TAG = require('overseer.constants').TAG
local overseer = require('overseer')

local modelsim_errorformat = [[** %tRROR: %f(%l): %m,]]
        .. [[** %tRROR: %m,]]
        .. [[** %tARNING: %m,]]
        .. [[** %tOTE: %m,]]
        .. [[%tRROR: %f(%l): %m,]]
        .. '%tARNING[%*[0-9]]: %f(%l): %m,'
        .. [[%tRROR: %m,]]
        .. '%tARNING[%*[0-9]]: %m'

local quartus_errorformat = [[%trror (%n): %m File: %f Line: %l,]]
        .. [[%tarning (%n): %m File: %f Line: %l,]]

local function find_fhlow_dirs()
    local dirname =  'flw'
    local flw_dir = vim.fs.find({ dirname }, { type = 'directory', upward = true, limit = math.huge})
    vim.list_extend(flw_dir, vim.fs.find({ dirname }, { type = 'directory', limit = math.huge }))
    return flw_dir
end

local function is_fhlow_project()
    local dirname =  'fhlow'
    local fhlow_dir = vim.fs.find({ dirname }, { type = 'directory', upward = true })[1]
    if fhlow_dir == nil then
        fhlow_dir = vim.fs.find({ dirname }, { type = 'directory', upward = false })[1]
    end

    if fhlow_dir == nil then
        return false
    end

    -- Checking if it's really a fhlow directory
    local is_fhlow = vim.fs.find({ 'Banner.tcl' }, { type = 'file', upward = false, path = fhlow_dir })[1] ~= nil

    return is_fhlow
end

---@type overseer.TemplateFileDefinition
local fhlow_tmpl = {
    name = 'fhlow compsim',
    params = {
        gui = { optional = true, type = 'boolean', desc = 'Run sim in gui', default = false },
        action = { type = 'enum', choices = {
            'CompSimQuestasim',
            'CompQuestasim',
            'SynQuartus',
            'SynLayQuartus',
        } },
        flw_dir = { type = 'string', desc = 'flw directory (containing simQuestasim and synQuartus)' },
    },
    builder = function(params)
        local cmd = 'make'

        local args = { }
        if params.gui then
            table.insert(args, params.action .. 'Gui')
        else
            table.insert(args, params.action .. 'Sh')
        end

        local efm = modelsim_errorformat
        local cwd = params.flw_dir .. '/simQuestasim'
        if string.gmatch(params.action, "Quartus")() ~= nil then
            cwd = params.flw_dir .. '/synlayQuartus'
            efm = quartus_errorformat
        end

        cwd = vim.fn.resolve(cwd)

        return {
            cmd = cmd,
            args = args,
            cwd = cwd,
            -- https://github.com/stevearc/overseer.nvim/blob/master/doc/components.md#on_output_quickfix
            components = {
                'default',
                { 'on_output_quickfix', errorformat = efm, open_on_match = true, set_diagnostics = true },
                'on_result_diagnostics',
            },
        }
    end,
    condition = {
        filetype = { 'vhdl', 'makefile', 'OverseerList' },
        callback = function(search)
            return is_fhlow_project()
        end,
    },
}

---@type overseer.TemplateFileProvider
return {
    generator = function(opts, cb)
        local ret = { overseer.wrap_template(fhlow_tmpl, { name = 'fhlow compsim' }) }
        local fhlow_dirs = find_fhlow_dirs()

        for _, dir in ipairs(fhlow_dirs) do
            local unitName = vim.fn.fnamemodify(dir, ":h:t")

            table.insert(
                ret,
                overseer.wrap_template(
                    fhlow_tmpl,
                    { name = string.format('fhlow \'%s\'', unitName) },
                    { gui = true, flw_dir = dir }
                )
            )
        end

        cb(ret)
    end,
    condition = {
        filetype = { 'vhdl', 'makefile', 'OverseerList' },
        callback = function(search)
            return is_fhlow_project()
        end,
    },
    --  TODO: Set up caching correctly
}
