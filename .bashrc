# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gitclone='GIT_CURL_VERBOSE=1 GIT_TRACE=1 HUB_VERBOSE=1 git clone'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null;
  then eval "$(pyenv virtualenv-init -)";
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export CUDA_HOME=/usr/local/cuda-10.0
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

export PATH=${CUDA_HOME}/bin:${PATH}

# if [[ -e ~/.bash/git-prompt.sh ]]; then # Show git branch name at command prompt
if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
	source /usr/lib/git-core/git-sh-prompt

	export GIT_PS1_SHOWDIRTYSTATE=true      # staged '+', unstaged '*'
	export GIT_PS1_SHOWUNTRACKEDFILES=true  # '%' untracked files
	export GIT_PS1_SHOWUPSTREAM="auto"      # '<' behind, '>' ahead, '<>' diverged, '=' no difference
	export GIT_PS1_SHOWSTASHSTATE=true      # '$' something is stashed
	#ref:https://digitalfortress.tech/tutorial/setting-up-git-prompt-step-by-step/
	MAGENTA="\[\033[0;35m\]"
	YELLOW="\[\033[01;33m\]"
	BLUE="\[\033[00;34m\]"
	LIGHT_GRAY="\[\033[0;37m\]"
	CYAN="\[\033[0;36m\]"
	GREEN="\[\033[00;32m\]"
	RED="\[\033[0;31m\]"
	VIOLET="\[\033[01;35m\]"
    WHITE="\[\033[0;37m\]"

	#local __cur_location="$BLUE\W"           # capital 'W': current directory, small 'w': full file path
	function __prompt_command() {
		local ERRORCODE="$?"
		PS1="${debian_chroot:+($debian_chroot)}"

		# Errorcode (conditional)
		if [ ${ERRORCODE} != 0 ]; then
			PS1+="\e[90m$WHITE    $(echo -e '\u2570\u2500\u2770')\e[1;31m$ERRORCODE\e[90m$WHITE$(echo -e '\u2771')\e[0m\n"
		fi

		# Main line
		local c="$WHITE$(echo -e '\u256d\u2500')"
		if [[ "$(dirs -p | wc -l)" != "1" ]] ; then
			local c="$WHITE$(echo -e '\u2934') "
		fi
		PS1+="\e[90m$c\e[0m"
		if [[ ! -z "${VIRTUAL_ENV}" ]]; then
			PS1+="\e[90m$WHITE$(echo -e '\u2770')\e[32m$(basename $VIRTUAL_ENV)\e[90m$WHITE$(echo -e '\u2771')\e[0m "
		fi
		### Add Git Status to bash prompt
		local __git_branch_color="$GREEN"
		local __git_status_symbol="" #"\xE2\x9C\x94"
		local __git_branch=$(__git_ps1)
        local __git_is_clean=1

		# colour branch name depending on state
		if [[ "${__git_branch}" =~ "*" ]]; then # if repository is dirty
			__git_branch_color="$YELLOW"
			__git_status_symbol+="●"
            __git_is_clean=0
        fi

		if [[ "${__git_branch}" =~ "+" ]]; then # if there are staged files
			__git_branch_color="$CYAN"
			__git_status_symbol+="✚"
            __git_is_clean=0
        fi

		if [[ "${__git_branch}" =~ "%" ]]; then # if there are only untracked files
			__git_branch_color="$LIGHT_GRAY"
			__git_status_symbol+="…"
            __git_is_clean=0
        fi
		if [[ "${__git_branch}" =~ "$" ]]; then # if there is something stashed
            __git_status_symbol+="(stashed)"
        fi
        if [[ __git_is_clean == 1 ]]; then
		    __git_status_symbol="✔" #"\xE2\x9C\x94"
        fi 
		if [[ "${__git_branch}" =~ "<" ]]; then # if there are behind
            __git_status_symbol+="|↓"
		elif [[ "${__git_branch}" =~ ">" ]]; then # if there are ahead
            __git_status_symbol+="|↑"
		elif [[ "${__git_branch}" =~ "<>" ]]; then # if there are ahead
            __git_status_symbol="✖"
			__git_branch_color="$RED"
        fi

		if [[ -z ${__git_branch} ]]; then
			__git_status_symbol=""
		fi
		parse_git_branch() {
			git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		}
		PS1+="\u@\h \[\033[32m\]\w" 
		PS1+="$__git_branch_color\$(parse_git_branch) $__git_status_symbol\[\033[00m\]"

		#### Change terminal title
		#PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
		#PS1+=" \e[33;1m\w\e[m"
		#PS1+="\$(__git_ps1)"

		# Command Line
		#PS1+="\n\e[90m$(echo -e '\u2570\u2500\u2bc8') \e[0m"
		PS1+="\n\e[90m$WHITE$(echo -e '└─▶ ') \e[0m"
	}

	export PROMPT_COMMAND=__prompt_command
fi
