DEFAULT_USER=''

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -d ~/.zsh/antigen ]]
then
  # Install package manager.
  # It keeps the installed packages under ~/.antigen
  git clone https://github.com/zsh-users/antigen.git ~/.zsh/antigen
fi
source ~/.zsh/antigen/antigen.zsh

# Exports
export EDITOR=vim
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=false
export NVM_COMPLETION=true
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_SDK_ROOT #:$HOME/.jenv/shims
export GPG_TTY=$(tty)
export CLOUDSDK_PYTHON=$(which python3.11)

export DOTNET_CLI_UI_LANGUAGE=en-US


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

plugins=(virtualenv)

# Bundles
antigen bundle lukechilds/zsh-nvm
antigen bundle git
# antigen bundle colored-man
antigen bundle z
antigen bundle node
antigen bundle lukechilds/zsh-better-npm-completion
# antigen bundle marzocchi/zsh-notify
antigen bundle rbenv
antigen bundle kubectl

# If the command is not found, but present in repositories, it
# will show extended info on how to install it.
# DISABLE BECAUSE SLOW
# antigen bundle command-not-found

# Syntax highlighting bundle, for example, highlight wrong command names in red.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions


# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

source ~/.alias

autoload -U +X bashcompinit && bashcompinit
eval "$(rbenv init - zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(jenv init -)"
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

