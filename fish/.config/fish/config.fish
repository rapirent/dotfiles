if status is-interactive
    # Commands to run in interactive sessions can go here
end
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
fish_add_path /Users/tony/.antigravity/antigravity/bin
fish_add_path /Users/tony/script/darwin
pyenv init - fish | source

set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH $ANDROID_HOME/tools $PATH

export NVM_DIR="$HOME/.nvm"
#set -gx KUBECONFIG ~/.kube/tonycluster.conf
set -gx KUBECONFIG ~/kubeconfig-eks-mgmt
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
set -Ux nvm_default_version 22.21.1
