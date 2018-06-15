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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/count0/google-cloud-sdk/path.bash.inc' ]; then source '/Users/count0/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/count0/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/count0/google-cloud-sdk/completion.bash.inc'; fi

export PATH="/usr/local/opt/node@8/bin:$PATH"
