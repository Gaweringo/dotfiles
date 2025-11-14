-- Some examples and stuff: https://github.com/folke/snacks.nvim/discussions/1768
return {
  {
  'gaweringo/snacks.nvim',
  branch = 'main',
  lazy = false,
  priority = 1000,
  dependencies = {
    -- To have todo_comments
    'folke/todo-comments.nvim',
  },
  -- enabled = false,
  ---@type snacks.Config
  opts = {
    gitbrowse = {}, -- Open remote for current git repo in browser
    -- Fuzzy finder and more (like Telescope or fzf-lua)
    -- file and current, so that for example oil or help buffers are replaced when opening a file using picker
    picker = {
      enabled = true,
      main = { file = false, current = true },
      sources = {
        -- https://github.com/folke/snacks.nvim/discussions/1804
        snippets = {
          supports_live = false,
          preview = 'preview',
          format = function(item, picker)
            local name = Snacks.picker.util.align(item.name, picker.align_1 + 5)
            return {
              { name,            item.ft == '' and 'Conceal' or 'DiagnosticWarn' },
              { item.description },
            }
          end,
          finder = function(_, ctx)
            local snippets = {}
            for _, snip in ipairs(require('luasnip').get_snippets().all) do
              snip.ft = ''
              table.insert(snippets, snip)
            end
            for _, snip in ipairs(require('luasnip').get_snippets(vim.bo.ft)) do
              snip.ft = vim.bo.ft
              table.insert(snippets, snip)
            end
            local align_1 = 0
            for _, snip in pairs(snippets) do
              align_1 = math.max(align_1, #snip.name)
            end
            ctx.picker.align_1 = align_1
            local items = {}
            for _, snip in pairs(snippets) do
              local docstring = snip:get_docstring()
              if type(docstring) == 'table' then
                docstring = table.concat(docstring)
              end
              local name = snip.name
              local description = table.concat(snip.description)
              description = name == description and '' or description
              table.insert(items, {
                text = name .. ' ' .. description, -- search string
                name = name,
                description = description,
                trigger = snip.trigger,
                ft = snip.ft,
                preview = {
                  ft = snip.ft,
                  text = docstring,
                },
              })
            end
            return items
          end,
          confirm = function(picker, item)
            picker:close()
            --
            local expand = {}
            require('luasnip').available(function(snippet)
              if snippet.trigger == item.trigger then
                table.insert(expand, snippet)
              end
              return snippet
            end)
            if #expand > 0 then
              vim.cmd ':startinsert!'
              vim.defer_fn(function()
                require('luasnip').snip_expand(expand[1])
              end, 50)
            else
              Snacks.notify.warn 'No snippet to expand'
            end
          end,
        },
        zoxide = {
          win = {
            preview = { minimal = true },
            input = {
              keys = {
                -- every action will always first change the cwd of the current tabpage to the project
                -- TODO: Make these better (maybbe don't tcd), and open oil in selected folder on enter
                ["<c-e>"] = { { "tcd", "picker_explorer" }, mode = { "n", "i" } },
                ["<c-f>"] = { { "tcd", "picker_files" }, mode = { "n", "i" } },
                ["<c-g>"] = { { "tcd", "picker_grep" }, mode = { "n", "i" } },
                ["<c-r>"] = { { "tcd", "picker_recent" }, mode = { "n", "i" } },
                ["<c-w>"] = { { "tcd" }, mode = { "n", "i" } },
                ["<c-t>"] = {
                  function(picker)
                    vim.cmd("tabnew")
                    Snacks.notify("New tab opened")
                    vim.print(picker)
                    picker:close()
                  end,
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      },
    },
    image = { enabled = true, doc = { enabled = false, conceal = true }, convert = { notify = false } }, -- Image, pdf and previews of them in typst, latex and markdown in neovim
    quickfile = { enabled = true },                                                                      -- Tries to speed up time to show the file when doing nvim somefile.txt
    bigfile = { enabled = true },                                                                        -- Disables tree-sitter and LSP for files over the specified limmit
    indent = { enabled = true, animate = { enabled = false } },                                          -- Indent and scope guides
    explorer = { replace_netrw = false },                                                                -- File tree for quick reference, but using oil as actual explorer
    -- TODO: Maybe try out notifier for nice looking notifications and notification history
    -- TODO: Look into how to set up scope to be able to go to start/end of highlighted scope and use them as textobjects
    -- https://github.com/folke/snacks.nvim/discussions/1619
    scratch = { enabled = true }, -- Scratch buffer
    -- Zen mode
    zen = { enabled = true, toggles = { dim = false }, win = { style = "zen", --[[ backdrop = { transparent = false, bg = "#101010" }, ]] width = 150 } },
  },
  init = function()
    -- Inform LSPs about file changes made with oil.nvim
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilActionsPost',
      callback = function(event)
        if event.data.actions.type == 'move' then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Toggling keymaps
        -- Spelling
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ts'
        Snacks.toggle.new({
          id = 'spelllang',
          name = 'German spelling',
          get = function()
            return vim.opt_local.spelllang:get()[1] ~= 'en'
          end,
          set = function(state)
            if state then
              vim.opt_local.spelllang = 'de'
            else
              vim.opt_local.spelllang = 'en'
            end
          end,
        }):map '<leader>tL'

        -- Text layout / width
        Snacks.toggle.new({
          id = 'tw',
          get = function()
            return vim.o.textwidth == 90
          end,
          set = function(turn_on)
            if turn_on then
              vim.o.colorcolumn = '+1'
              vim.o.textwidth = 90
            else
              vim.o.textwidth = 0
              vim.o.colorcolumn = '120'
            end
          end,
          name = 'text[w]idth',
        }):map '<leader>tw'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tW'

        Snacks.toggle.diagnostics():map '<leader>td'
        Snacks.toggle.line_number():map '<leader>tl'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>tc'
        Snacks.toggle.treesitter():map '<leader>tT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>tb'
        Snacks.toggle.inlay_hints():map '<leader>th'
        Snacks.toggle.indent():map '<leader>ti'

        Snacks.toggle.new({
          id = 'format',
          name = 'Format On Save',
          get = function()
            return not vim.b.disable_autoformat
          end,
          set = function(turn_on)
            if turn_on then
              vim.b.disable_autoformat = false
            else
              vim.b.disable_autoformat = true
            end
          end,
        }):map '<leader>tF'

        Snacks.toggle.new({
          id = 'trim_trailspace',
          name = 'Trim trailing whitespace at (e)nd',
          get = function()
            return not vim.b.no_trim_trailspace
          end,
          set = function(turn_on)
            if turn_on then
              vim.b.no_trim_trailspace = false
            else
              vim.b.no_trim_trailspace = true
            end
          end,
        }):map '<leader>te'

        Snacks.toggle.new({
          id = 'virtual_lines',
          name = 'Virtual lines',
          get = function()
            return (vim.diagnostic.config().virtual_lines ~= false)
          end,
          set = function(state)
            vim.diagnostic.config({ virtual_lines = state })
          end,
        }):map '<leader>tv'

        Snacks.toggle.new({
          id = 'update_on_insert',
          name = 'Diagnostic update on insert',
          get = function()
            return (vim.diagnostic.config().update_in_insert ~= false)
          end,
          set = function(state)
            vim.diagnostic.config({ update_in_insert = state })
          end,
        }):map '<leader>tV'

        Snacks.toggle.new({
          id = 'dropbar_toggle',
          name = 'Dropbar',
          get = function()
            return (vim.o.winbar ~= "")
          end,
          set = function(state)
            vim.print(state)
            if state then
              vim.o.winbar = [[%{%v:lua.dropbar()%}]]
            else
              vim.o.winbar = nil
            end
          end,
        }):map '<leader>tD'

        vim.api.nvim_create_user_command('GitBrowse', function() Snacks.gitbrowse() end, {})
      end,
    })
  end,

  -- stylua: ignore
  keys = {
    -- essential keymaps
    { "<leader><leader>", function() Snacks.picker.smart() end,    desc = "Snack Smart" },
    {
      "<leader>sb",
      function()
        Snacks.picker.buffers({
          -- Selct last used buffer
          on_show = function(picker) picker.list:view(2) end
        })
      end,
      desc = "Buffers"
    },
    { "<leader>E",        function() Snacks.picker.explorer() end, desc = "Toggle File Tree Explorer" },
    -- find
    {
      "<leader>sf",
      function()
        -- Start search in current oil dir, if oil is open
        local _, oil_dir = pcall(require('oil').get_current_dir)
        Snacks.picker.files({ cwd = oil_dir })
      end,
      desc = "Find Files"
    },
    { "<leader>snf", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config"), title = 'Config Files' }) end,       desc = "Config File" },
    { "<leader>sng", function() Snacks.picker.grep({ cwd = vim.fn.stdpath("config"), title = 'Config Grep' }) end,         desc = "Config Grep" },
    { "<leader>snp", function() Snacks.picker.lazy() end,                                                                  desc = "Config search Packages" },
    { "<leader>sns", function() Snacks.picker.files({ cwd = vim.fn.stdpath('data'), title = 'nvim data files' }) end,      desc = "Search nvim data/[s]hare directory" },
    { "<leader>snF", function() Snacks.picker.files({ cwd = vim.fn.stdpath('data'), title = 'nvim data files' }) end,      desc = "Search [F]iles in data directory" },
    { "<leader>snG", function() Snacks.picker.grep({ cwd = vim.fn.stdpath('data'), title = 'nvim data grep' }) end,        desc = "Grep nvim data/[s]hare directory" },
    { "<leader>s%",  function() Snacks.picker.recent() end,                                                                desc = "Recent" },

    -- Root and other premade directory searches
    { "<leader>s.f", function() Snacks.picker.files({ cwd = require('mini.misc').find_root(), title = 'Root files' }) end, desc = "Root dir file" },
    { "<leader>s.g", function() Snacks.picker.grep({ cwd = require('mini.misc').find_root(), title = 'Root grep' }) end,   desc = "Root dir grep" },
    { "<leader>s~f", function() Snacks.picker.files({ cwd = '~', title = 'Home files' }) end,                              desc = "Home dir file" },
    { "<leader>s~g", function() Snacks.picker.grep({ cwd = '~', title = 'Home grep' }) end,                                desc = "Home dir grep" },

    -- git
    { "<leader>gsf", function() Snacks.picker.git_files() end,                                                             desc = "Find Git Files" },
    { "<leader>gsl", function() Snacks.picker.git_log() end,                                                               desc = "Git Log" },
    { "<leader>gsL", function() Snacks.picker.git_log_line() end,                                                          desc = "Git Log for current Line" },
    { "<leader>gsF", function() Snacks.picker.git_log_file() end,                                                          desc = "Git Log for current File" },
    { "<leader>gss", function() Snacks.picker.git_status() end,                                                            desc = "Git Status" },
    { "<leader>gsS", function() Snacks.picker.git_stash() end,                                                             desc = "Git Stash" },
    { "<leader>gsb", function() Snacks.picker.git_branches() end,                                                          desc = "Git branches" },
    { "<leader>gsd", function() Snacks.picker.git_diff() end,                                                              desc = "Git diff (Hunks)" },
    { "<leader>gsg", function() Snacks.picker.git_grep() end,                                                              desc = "Git grep" },

    -- grep
    { "<leader>sl",  function() Snacks.picker.lines() end,                                                                 desc = "Buffer Lines" },
    { "<leader>s/",  function() Snacks.picker.grep_buffers() end,                                                          desc = "Grep Open Buffers" },
    {
      "<leader>sg",
      function()
        -- Start in currently opended oil dir, if available
        local _, oil_dir = pcall(require('oil').get_current_dir)
        Snacks.picker.grep({ cwd = oil_dir })
      end,
      desc = "Grep"
    },
    { "<leader>sw", function() Snacks.picker.grep_word({hidden = true, ignored = true}) end,                         desc = "Visual selection or word", mode = { "n", "x" } },

    -- search
    { '<leader>s"', function() Snacks.picker.registers() end,                         desc = "Registers" },
    { "<leader>sa", function() Snacks.picker.autocmds() end,                          desc = "Autocmds" },
    { "<leader>s:", function() Snacks.picker.command_history() end,                   desc = "Command History" },
    { "<leader>sc", function() Snacks.picker.commands() end,                          desc = "Commands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,                       desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end,                              desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end,                        desc = "Highlights" },
    { "<leader>sj", function() Snacks.picker.jumps() end,                             desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                           desc = "Keymaps" },
    { "<leader>sL", function() Snacks.picker.loclist() end,                           desc = "Location List" },
    { "<leader>sM", function() Snacks.picker.man() end,                               desc = "Man Pages" },
    { "<leader>sm", function() Snacks.picker.marks() end,                             desc = "Marks" },
    { "<leader>sr", function() Snacks.picker.resume() end,                            desc = "Resume" },
    { "<leader>sq", function() Snacks.picker.qflist() end,                            desc = "Quickfix List" },
    { "<leader>sC", function() Snacks.picker.colorschemes() end,                      desc = "Colorschemes" },
    { "<leader>si", function() Snacks.picker.icons() end,                             desc = "Icons" },
    { '<leader>ss', function() Snacks.picker.pickers() end,                           desc = "Search Select Pickers" },
    { "<leader>su", function() Snacks.picker.undo() end,                              desc = "Undo" },
    { "<leader>sS", function() Snacks.picker.snippets() end,                          desc = "Snippets" },
    -- TODO: Figure out how to add keybind to open selected folder in Oil
    { "<leader>sz", function() Snacks.picker.zoxide() end,                            desc = "Zoxide" },
    { "<leader>sp", function() Snacks.picker.projects({ dev = "~/programming" }) end, desc = "Projects" },
    {
      "<leader>sD",
      function()
        -- Search for directories and open them in oil
        local _, oil_dir = pcall(require('oil').get_current_dir)
        Snacks.picker.pick({
          title = "Directories",
          format = "file",
          cwd = oil_dir,
          finder = function(opts, ctx)
            local args = { "--type", "directory", "--color", "never" }
            if opts.hidden then
              table.insert(args, "--hidden")
            end
            if opts.ignored then
              table.insert(args, "--no-ignore")
            end
            local cwd = vim.fs.normalize(opts.cwd or vim.uv.cwd() or ".")
            local proc_opts = {
              cmd = "fd",
              args = args,
              ---@param item snacks.picker.finder.Item
              transform = function(item)
                item.cwd = cwd
                item.file = item.text
                item.dir = true
              end,
            }
            return require("snacks.picker.source.proc").proc({ opts, proc_opts }, ctx)
          end,
          confirm = function(picker, item)
            picker:close()
            require('oil').open(item._path)
          end,
        })
      end,
      desc = "Directories"
    },

    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,                                                 desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,                                                desc = "Goto Declarations" },
    { "gr",         function() Snacks.picker.lsp_references() end, nowait = true,                                   desc = "References" },
    { "gi",         function() Snacks.picker.lsp_implementations() end,                                             desc = "Goto Implementation" },
    { "gt",         function() Snacks.picker.lsp_type_definitions() end,                                            desc = "Goto Type Definition" },
    { "<leader>ls", function() Snacks.picker.lsp_symbols({ filter = { default = true }, keep_parents = true }) end, desc = "LSP Symbols" },
    { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols({ keep_parents = true }) end,                    desc = "LSP Workspace Symbols" },
    { "gai",        function() Snacks.picker.lsp_incoming_calls() end,                                              desc = "C[a]lls Incoming" },
    { "gao",        function() Snacks.picker.lsp_outgoing_calls() end,                                              desc = "C[a]lls Outgoing" },

    -- Scratch
    { "<leader>,",  function() Snacks.scratch() end,                                           desc = "Create scratch buffer" },
    { "<leader>s,", function() Snacks.scratch.select() end,                                    desc = "Scratch buffers" },

    -- Zen
    { "<leader>tz", function() Snacks.zen() end,                                               desc = "[z]en" },
    { "<leader>tZ", function() Snacks.zen.zoom() end,                                          desc = "[Z]oom" },

    -- Words
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,                            desc = "Next reference" },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                           desc = "Previous reference" },

    -- Gitbrowse
    { "<leader>gB", function() Snacks.gitbrowse() end,                                         desc = "GitBrowse" },
  },
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
        require("advanced_git_search.snacks").setup{
          diff_plugin = 'diffview',
        }
    end,
    dependencies = {
      "gaweringo/snacks.nvim"
    },
    keys = {
      { '<leader>gsG', '<Cmd>AdvancedGitSearch search_log_content<Cr>', desc = '[G]rep log content' }
    }
  },
}
