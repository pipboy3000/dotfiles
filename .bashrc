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

export PATH="~/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/usr/X11R6/bin:"

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

