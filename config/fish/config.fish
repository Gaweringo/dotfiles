{{#if (is_executable "zvm")}}
fish_add_path ~/.zvm/bin
{{/if}}
if status is-interactive
    # Commands to run in interactive sessions can go here

    # inits
    {{#if (is_executable "starship")}}
    starship init fish | source
    {{/if}}
    {{#if (is_executable "zoxide")}}
    zoxide init fish | source
    {{/if}}

    # aliases
    alias ..='cd ..'

    {{#if (is_executable "exa")}}
    alias x=exa
    alias xt='eza -lah --icons=always --tree --level'
    alias xl='eza -lah --icons=always'
    alias lx='xl'
    alias tx='xt'
    {{/if}}
    {{#if (is_executable "lazygit")}}
    alias lg=lazygit
    {{/if}}
    {{#if (is_executable "nvim")}}
    alias n=nvim
    set -gx EDITOR nvim
    set -gx MANPAGER 'nvim +Man!'
    {{/if}}
    {{#if (is_executable "fdfind")}}
    alias fd=fdfind
    {{/if}}
    alias ip='ip -c'
    {{#if (is_executable "exa")}}
    alias snv=svn
    {{/if}}

    {{#if (is_executable "opam")}}
    # opam configuration
    source /home/gawer/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    {{/if}}

    {{#if (is_executable "go")}}
    fish_add_path ~/go/bin/
    {{/if}}

    # abbr
    abbr --add 'refresh' 'source ~/.config/fish/config.fish'
    {{#if (is_executable "git")}}
    abbr --add 'gc' 'git commit -m'
    abbr --add 'ga' 'git add'
    {{/if}}

    {{#if (is_executable "yazi")}}
    alias y=yazi
    function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    {{/if}}

    {{#if (is_executable "fzf")}}
    fzf --fish | source
    {{/if}}

    {{#if (is_executable "wl-copy")}}
    alias pwdc='pwd | wl-copy --trim-newline'
    {{/if}}

    {{#if (is_executable "pacman")}}
    alias pacman-search="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"
    {{/if}}
    {{#if (is_executable "paru")}}
    alias paru-search="paru -Slq | fzf --preview 'paru -Si {}' --layout=reverse"
    {{/if}}

    function cdf --description 'Change to first directory that matches'
        set -l target_dir (fd -t directory -1 -H -I "$argv")
        if test $target_dir
            cd $target_dir
        else
            echo "No directory found, that matches $argv"
        end
    end


    function cdi --description 'Change to sub dir interactively'
        set -l target_dir (fzf --walker dir,hidden --query="$argv" --select-1)
        if test $target_dir
            cd $target_dir
        end
    end

    function neg
        nvim . -c Neogit
    end

    function dv
        nvim . -c DiffviewOpen
    end
end

