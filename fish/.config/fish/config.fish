if status is-interactive
    # Commands to run in interactive sessions can go here
end
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
fish_add_path /Users/tony/.antigravity/antigravity/bin
pyenv init - fish | source

set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
