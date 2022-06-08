export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f $HOME/.path ]; then
    source $HOME/.path
fi

HISTSIZE=200000
HISTFILESIZE=200000
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -a'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rg='rg --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gclone='GIT_CURL_VERBOSE=1 GIT_TRACE=1 HUB_VERBOSE=1 git clone'
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

export PATH="$HOME/.nodenv/bin:$PATH"
if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
if [ -f $HOME/.nb_util ]; then
  source $HOME/.nb_util
fi
alias news="newsboat"
alias vim="nvim"
# cpp
export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export PATH=$PATH:/opt/gradle/gradle-7.0/bin

# completions
source $(pyenv root)/completions/pyenv.zsh

source ~/.zinit/bin/zinit.zsh
zinit ice wait'!0'
#zinit load halfo/lambda-mod-zsh-theme
zinit ice blockf
zinit light zsh-users/zsh-completions
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit load zdharma/fast-syntax-highlighting
zinit load Aloxaf/fzf-tab
export PURE_GIT_STASH_SYMBOL="✚ "
zstyle :prompt:pure:path color white
zstyle :prompt:pure:git:stash show yes



export PATH="$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"


# Avoid duplicates
#HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
#setopt histappend

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=/opt/homebrew/bin/:$PATH
export PATH=$PATH:/opt/homebrew/Cellar/openvpn/2.5.2/sbin/
export PATH=$PATH:$HOME/k3d/bin/
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Avoid duplicates
# bash HISTCONTROL=ignoredups:erasedups
setopt histignoredups
# When the shell exits, append to the history file instead of overwriting it
setopt appendhistory
setopt sharehistory
setopt incappendhistory
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
