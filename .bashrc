export CLICOLOR=1
TERM=xterm-256color

alias less='less -R'
alias ls='ls -GAFvh'
alias ll="ls -l"
alias la="ls -a"
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias grep='grep --color'
alias f='open .'
alias git=hub
alias v='v -l'
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
alias python='python3'
alias pip='pip3'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

export HISTCONTROL=ignoreboth:erasedups
export PATH=~/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
export PATH=$PATH:~/.composer/vendor/bin
export PATH="$PATH:`yarn global bin`"
export MANPATH="/usr/local/man:/usr/share/man:/usr/X11/man"

export LANG=ja_JP.UTF-8
export EDITOR=vim
#export PAGER=lv
#export GIT_PAGER='lv -c'
export PS1="\u@\h[\w]\$"

umask 22

# set -o posix

# Make bash check it's window size after a process complete
shopt -s checkwinsize

### rbenv
eval "$(rbenv init -)"

### node
export NODE_PATH="/usr/local/lib/node_modules"

### z
. `brew --prefix`/etc/profile.d/z.sh
function precmd() {
    z --add "$(pwd -P)"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### AWS
if [ -f ~/.aws/blog ]; then
    source ~/.aws/blog
fi

### homebrew
if [ -f ~/.config/homebrew_token ]; then
  source ~/.config/homebrew_token
fi

### home bin
export PATH="/Users/count0/bin:$PATH"

### get current branch in git repo
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

### get current status of git repo
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

### gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

### prompt
export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\w \[\e[34;40m\]\`parse_git_branch\`\[\e[m\]\n\\$ "

# GOLANG
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
complete -C '/usr/local/bin/aws_completer' aws

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
