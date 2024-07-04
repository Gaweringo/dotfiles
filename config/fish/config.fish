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
    {{#if (is_executable "exa")}}
    alias x=exa
    {{/if}}
    {{#if (is_executable "lazygit")}}
    alias lg=lazygit
    {{/if}}
    {{#if (is_executable "nvim")}}
    alias n=nvim
    set -gx EDITOR nvim
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
    function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    {{/if}}
end

