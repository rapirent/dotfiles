export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f $HOME/.path ]; then
    source $HOME/.path
fi

HISTSIZE=200000
HISTFILESIZE=200000
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gclone='GIT_CURL_VERBOSE=1 GIT_TRACE=1 HUB_VERBOSE=1 git clone'
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
source ~/.zinit/bin/zinit.zsh
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zdharma/fast-syntax-highlighting
export PURE_GIT_STASH_SYMBOL="✚ "
zstyle :prompt:pure:path color white
zstyle ':prompt:pure:prompt:*' color white
zstyle :prompt:pure:user color blue
zstyle :prompt:pure:host color cyan
zstyle ':prompt:pure:git:*' show yes


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null;then
  eval "$(pyenv virtualenv-init -)";
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
export PATH="$HOME/.nodenv/bin:$PATH"

if [ -f $HOME/.nb_util ]; then
  source $HOME/.nb_util
fi
[[ -e nb ]] && nb sync
alias news="newsboat"
if command -v nvim 1>/dev/null 2>&1; then
  alias vim="nvim"
fi
# cpp
export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export PATH=$PATH:/opt/gradle/gradle-7.0/bin

if command -v /opt/homebrew/bin/brew 1>/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin



# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
setopt histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
