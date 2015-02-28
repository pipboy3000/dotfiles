source ~/.bashrc

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.rbenv/completions/rbenv.bash ]; then
    . ~/.rbenv/completions/rbenv.bash
fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
