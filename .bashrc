export CLICOLOR=1
TERM=xterm-256color

alias less=lv
alias ls='ls -G -F -v -h'
alias ll="ls -lh"
alias la="ls -a"
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias grep='grep --color'

export PATH="~/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/usr/X11R6/bin"

export MANPATH="/usr/local/man:/usr/share/man:/usr/X11/man"

export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=lv
export GIT_PAGER='lv -c'
export PS1="\u@\h[\w]\$"

umask 22

set -o posix

# Make bash check it's window size after a process complete
shopt -s checkwinsize

eval "$(rbenv init -)"

export NODE_PATH="/usr/local/lib/node_modules"

. `brew --prefix`/etc/profile.d/z.sh
function precmd() {
    z --add "$(pwd -P)"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### AWS
if [ -f ~/.aws_settings ]; then
    source ~/.aws_settings
fi

### home bin
export PATH="/Users/count0/bin:$PATH"

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\w \[\e[34;40m\]\`parse_git_branch\`\[\e[m\]\n\\$ "

# GOLANG
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
