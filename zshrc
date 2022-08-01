DEFAULT_USER=''

if [[ ! -d ~/.zsh/antigen ]]
then
  # Install package manager.
  # It keeps the installed packages under ~/.antigen
  git clone https://github.com/zsh-users/antigen.git ~/.zsh/antigen
fi
source ~/.zsh/antigen/antigen.zsh

# Exports
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

plugins=(virtualenv)

# Bundles
antigen bundle lukechilds/zsh-nvm
antigen bundle git
antigen bundle colored-man
antigen bundle z
antigen bundle node
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle marzocchi/zsh-notify
antigen bundle pxgamer/quoter-zsh

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


source ~/.purepower
source ~/.alias

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

