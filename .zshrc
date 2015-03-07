# ---------------------------------------------------------
# Oh-My-ZSH Configuration
# ---------------------------------------------------------
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chh"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws
         brew
         bundler
         capistrano
         git
         git-extras
         git-flow
         gem
         history-substring-search
         marked
         npm
         rails
         rvm
         safe-paste
         tmux
         tmuxinator
         vagrant
         z
         zaw
         zsh-output-highlighting
         zsh-syntax-highlighting)

# ---------------------------------------------------------
# Customizations
# ---------------------------------------------------------

source ~/.nvm/nvm.sh

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{exports,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000

# source bash completion, also works for Z shell
# [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Tmuxinator Environment Integration
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# ----------------------------------------
# Miscellaneous
# ----------------------------------------

# if [ $(rvm current) = 'system' ]; then
#   rvm 2.0.0 --default
# fi

# Now I can copy-paste commands with a dollar in front into zsh :)
$ () { "$@" }

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm ]]
source $ZSH/oh-my-zsh.sh

# fixed history-substring-search keybinding issues on OS X 10.9
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
