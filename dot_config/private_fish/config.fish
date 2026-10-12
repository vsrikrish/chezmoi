# Always source
source $__fish_config_dir/environment.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Print a new line after any command
source ~/.config/fish/functions/postexec_newline.fish

# Setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# `ls` → `exa` abbreviation
# Requires `brew install exa`
if type -q eza
  abbr --add -g ls 'eza --long --hyperlink --time-style relative --time modified --classify --all --header --icons --git --git-repos --no-user --tree --level 1'
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# `rm` → `trash` abbreviation (moves files to the trash instead of deleting them)
# Requires `brew install trash`
if type -q trash
  abbr --add -g rm 'trash'
end

fzf --fish | source
zoxide init fish | source
direnv hook fish | source
starship init fish | source
