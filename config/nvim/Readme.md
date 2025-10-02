- dotfiles to look at
- [Catagoose](https://github.com/catgoose/nvim)
- [ThePrimeagen](https://github.com/ThePrimeagen/init.lua)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [MrJakob nvim-from-scratch](https://github.com/jakobwesthoff/nvim-from-scratch)
- [CadeMichael](https://github.com/CadeMichael/nvim) has a bunch of ftplugin scripts
- Generally dotfiles from Neovim maintainers

# Next up
- [x] mini.nvim
    - [X] Copy some nice utility from mini.basics (`g/` to search visual selection, )
- [X] neogit
    - [X] diffview
        - [ ] Look through possible settings and usage a bit
    - [ ] git-conflict maybe
- [X] blink.cmp `slect_next` skips the first item
- [X] blink.cmp make cmdline tab not skip over first item
- [ ] Figure out how to disable/toggle snacks.image
    - [x] Or / and disable math support either in render-markdown or snacks.image
- [X] LuaSnip snippets
- [X] Overseer / code runner (sniprun?) / compiler
    - [ ] Look into how writing :compiler :make works for differnt file types
    - [ ]  How to send overseer output to quickfix list
- [X] Markdown rendering and previewing
    - [X] Setup latex treesitter for render-markdown and add `python-pylatexenc` to install script for the `latex2text` command
    - Install: `sudo pacman -S texlive python-pylatexenc ghostscript`
- [X] Debugging
- [X] Figure out why the `oil:` folder shows up in every (cwd) directory when using oil
- [X] Recreate Bmessages (or :B command to do like `:B compiler` or `:B messages` and send it to a new buffer)
- [X] improver overseer template for vunit
- [ ] try out nvim-autopairs
- [X] switch to toggleterm
    - [ ] Overseer integration
    - [ ] Add commands for send selection to toggle term (so that ipyhton can be run in toggle term and then you can
    send the selected python snippet to it)

# General todos
- [X] Check if bmessages.nvim is needed, if Snacks has a Snacks.notifier.show_history() or so
    (note bmessages shows more messages than snacks notifier. Check if that's needed)
    Bmessages is nice
    - [ ] Save bmessages from the linux install and recreate it as a plugin in plugin/
- [X] Look into `vim.snippet` [blink.cmp section about snipptes](https://cmp.saghen.dev/configuration/snippets)
- [X] Look into how to close some windows automatically if they are the last ones. e.g. DapView and DapWidgets, .. (edgy.nvim can do this)
- [ ] Tab term (terminal in new tab) and set up some chansend() actions for it

# Enhancements for already installed plugins
- [ ] [Snacks picker for snippets](https://github.com/folke/snacks.nvim/discussions/1804)
- [X] Check if it's possible to make <C-f> default in command mode
- [ ] Debugging
    - [X] [debugmaster.nvim](https://github.com/miroshQa/debugmaster.nvim) for debug mode
    - [ ] [dap-cortex-debug] for cortex-debug capability
    - [ ] Disassembly view for debugmaster
- [ ] Add execute ability to bash/sh scratch buffer in snacks
- [ ] Zeal/devdocs integration
- [X] nvim as default man pager (`$MANPAGER=nvim +Man!`)
- [X] [Snacks picker for snippets](https://github.com/folke/snacks.nvim/discussions/1804)
- [X] json-lsp and maybe fixjson
- [X] Invastigate why DapTerminate closes the currently active buffer
    -  [ ] Invastigate why nvim-dap-virtual-text doesn't dissapear on dap termination (but does when the program runns to the end)

# Plugins to look into
- [x] [nvim-lsp-endhints] for inlay hints at the end of the line
    - Don't show up on the first buffer on their own (Rust at least). Need to :e or actually change something in the file
- [X] [arrow.nvim](https://github.com/otavioschwanck/arrow.nvim) or [harpoon2] for quick navigation
- [ ] [actions-preview] for showing LSP code actions diffs
- [ ] [neogen] for doc comment generation
- [ ] [project.nvim] automatically finds a project root (.git, lsp root indicators, ...) to change nvim cwd to that
    folder, when opened in a sub directory.
    - mini.misc has similar funcitonality with `setup_auto_root()`
- [X] [jaq-nvim](https://github.com/is0n/jaq-nvim) for a quick-run command (Run file or selection)
    - Or [sniprun](https://github.com/michaelb/sniprun) more popular and new/more updated
- [X] [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [ ] [flash.nvim](https://github.com/folke/flash.nvim) for 2d jumping
- [ ] [ssr.nvim](https://github.com/cshuaimin/ssr.nvim) Structural search and replace
- [ ] [dial.nvim](https://github.com/monaqa/dial.nvim) For better ^A and ^X
- [ ] [nvim-spider] To go to words in camelCase or SNAKE_CASE variables (maybe also possible natively in vim)
- [ ] [substitute.nvim](https://github.com/gbprod/substitute.nvim) For nice :s things
- [ ] [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim) for refactoring nicities
- [ ] [cmdbuf.nvim](https://github.com/notomo/cmdbuf.nvim) For making the command-line window be more like anormal buffer, basically like C-f in command-line
- [ ] [smarter-splits.nvim] For better splitting (resize mode) and Terminal multiplexer integration
    - [ ] [resize-mode.nvim]
    - [ ] [focus.nvim] has auto splitting funcitonality
    - [ ] [winshift] for nice window re-arrangement
    - [ ] [winmove.nvim] easy move, swap and resize windows
- [ ] [nvim-bqf], [quicker.nvim] or [trouble.nvim] for better quickfix list
- [ ] **Outline** plugins: [aerial.nvim](https://github.com/stevearc/aerial.nvim), [outline.nvim](https://github.com/hedyhli/outline.nvim) or [trouble.nvim](https://github.com/folke/trouble.nvim)
- [ ] [nvim-various-textobjs]
- [ ] [csvview.nvim]
- [ ] [Codebook lsp] for language aware spell checking
- [X] [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) for breadcrumbs (scope list shown at top like VS C*de)
- [ ] [nvim-lint](https://github.com/mfussenegger/nvim-lint) for linting

## C/C++
[Setup guide](https://hobyr.github.io/2023/01/07/neovim_setup.html)
- [ ] [cmake-tools.nvim]
- [ ] [nvim-cpp-tools], or maybe [generate.nvim](https://github.com/eriks47/generate.nvim)
- [ ] [xmake.nvim]

# Commands to remember
- `CTRL-w ]` to jump to the "definition" of the word under the cursor in a new split window
~- `CTRL-w d` to jump to the definition of the word under the cursor in a new split window (by default remapped to hover
             in nvim. Set `unmap <C-w>d` to get the split definition function to work)~
- `CTRL-w ^` split window and edit alternative file
