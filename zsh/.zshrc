ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
[[ ! -f "$ZINIT_HOME" ]] || git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# theme
#zinit ice pick"async.zsh" src"pure.zsh"
#zinit light sindresorhus/pure
#export PURE_GIT_STASH_SYMBOL="✚ "
#zstyle :prompt:pure:path color white
#zstyle :prompt:pure:git:stash show yes
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#######
zinit ice blockf atpull'zinit creinstall -q .'
#zinit light zsh-users/zsh-completions

autoload compinit
compinit

#zinit load Aloxaf/fzf-tab
zinit load zdharma-continuum/history-search-multi-word
zinit light zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-completions
zinit light jonmosco/kube-ps1
PROMPT='$(kube_ps1)'$PROMPT



export PATH="$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"


# Avoid duplicates
#HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
#setopt histappend


export PATH=/opt/homebrew/bin/:$PATH
export PATH=$PATH:/opt/homebrew/Cellar/openvpn/2.5.2/sbin/
export PATH=$PATH:$HOME/k3d/bin/
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Avoid duplicates
# bash HISTCONTROL=ignoredups:erasedups
#setopt histignoredups
# When the shell exits, append to the history file instead of overwriting it
#setopt appendhistory
#setopt sharehistory
setopt incappendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
alias urlencode='python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))'
alias urldecode='python3 -c "import urllib.parse, sys; print(urllib.parse.unquote(sys.argv[1]))"'
alias z='kubectl'
