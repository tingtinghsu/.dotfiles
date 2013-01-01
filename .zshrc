# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chh"

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000

export BUNDLER_EDITOR=subl

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow gem rvm sublime history-substring-search zsh-syntax-highlighting vagrant brew capistrano bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ $(rvm current) = 'system' ]; then
  rvm 1.9.3 --default
fi

# AWS EB CLI
export PATH=$PATH:/Users/whocareu2008/.aws-eb-cli/eb/macosx/python2.7/
export PATH=/Users/whocareu2008/.rvm/gems/ruby-1.9.3-p327/bin:/Users/whocareu2008/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/whocareu2008/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/whocareu2008/.rvm/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/whocareu2008/.aws-eb-cli/eb/macosx/python2.7/
