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

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_SDK_ROOT=/Users/count0/Library/Android/sdk
export ANDROID_HOME=/Users/count0/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools
