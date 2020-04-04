# ---------------------------------------------------------
# Oh-My-ZSH Configuration
# ---------------------------------------------------------
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws
         bundler
         git
         git-extras
         gem
         heroku
         history-substring-search
         npm
         nvm
         rails
         rvm
         safe-paste
         tmux
         tmuxinator
         yarn
         z
         zaw
         zsh-output-highlighting
         zsh-syntax-highlighting)

# ---------------------------------------------------------
# Customizations
# ---------------------------------------------------------

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000

# source bash completion, also works for Z shell
# [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# ----------------------------------------
# Miscellaneous
# ----------------------------------------

# if [ $(rvm current) = 'system' ]; then
#   rvm 2.0.0 --default
# fi

# Now I can copy-paste commands with a dollar in front into zsh :)
$ () { "$@" }

# RVM
export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm ]]

# GVM
[[ -s "/Users/chh/.gvm/scripts/gvm" ]] && source "/Users/chh/.gvm/scripts/gvm"

source $ZSH/oh-my-zsh.sh

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{exports,aliases,profile}; do
  [ -r "$file" ] && source "$file"
done
unset file

# fixed history-substring-search keybinding issues on OS X 10.9
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# set variables for iterm status bar
iterm2_print_user_vars() {
  iterm2_set_user_var nodeVersion $(node -v)
  iterm2_set_user_var pwd $(pwd)
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chh/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/chh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chh/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/chh/google-cloud-sdk/completion.zsh.inc'; fi

# Calling nvm use automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
