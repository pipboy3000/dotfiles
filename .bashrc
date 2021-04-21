#shellcheck disable=SC1090

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
PATH=~/bin:~/.cargo/bin:$(yarn global bin):~/.rbenv/shims:$PATH
export PATH
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
. "$(brew --prefix)/etc/profile.d/z.sh"
function precmd() {
    z --add "$(pwd -P)"
}

### AWS
if [ -f ~/.aws/blog ]; then
    source ~/.aws/blog
fi

### homebrew
if [ -f ~/.config/homebrew_token ]; then
  source ~/.config/homebrew_token
fi

### gitignore.io
function gi() { curl -L -s "https://www.gitignore.io/api/$*" ;}

complete -C '/usr/local/bin/aws_completer' aws

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort' --inline-info"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# starship
eval "$(starship init bash)"
complete -C /Users/count0/bin/vault vault

complete -C /usr/local/bin/terraform terraform

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/count0/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;