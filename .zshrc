# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chh"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000

export BUNDLER_EDITOR=subl

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew
         bundler
         capistrano
         git
         git-flow
         gem
         history-substring-search
         lol
         marked
         rails3
         redis-cli
         rvm
         sublime
         vagrant
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Initialize RVM
PATH=$PATH:$HOME/.rvm/bin

# if [ $(rvm current) = 'system' ]; then
#   rvm 2.0.0 --default
# fi
