source ~/.bashrc

### completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.rbenv/completions/rbenv.bash ]; then
    . ~/.rbenv/completions/rbenv.bash
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
