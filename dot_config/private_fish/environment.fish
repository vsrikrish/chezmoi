fish_add_path -g ~/.local/bin

switch (uname)
    case Darwin
        # Homebrew
        if test -x /opt/homebrew/bin/brew
            /opt/homebrew/bin/brew shellenv | source
        end

        # Julia (juliaup)
        fish_add_path -g ~/.juliaup/bin

        # Ruby (Homebrew)
        fish_add_path -g /opt/homebrew/opt/ruby/bin
        fish_add_path -g (gem environment gemdir)/bin
        fish_add_path -g (ruby -r rubygems -e 'puts Gem.user_dir')/bin

        # Apps and tools
        fish_add_path -ga "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
        fish_add_path -ga ~/Applications/Inkscape.app/Contents/MacOS
        fish_add_path -ga ~/.lmstudio/bin

        # Java
        set -gx JAVA_HOME /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
        fish_add_path -g $JAVA_HOME/bin
end

set -gx JULIA_PROJECT @.
set -gx JULIA_NUM_THREADS auto

set -gx EZA_CONFIG_DIR /Users/vs498/.config/eza/theme.yml
set -gx EDITOR 'zed --wait'
set -gx VISUAL $EDITOR
set -gx LOCAL_NOTEBOOK_DEV 1
