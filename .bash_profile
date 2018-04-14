# That should square you away for about 10 years. :p
HISTFILESIZE=1000000000
HISTSIZE=1000000

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# To use RVM bash completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# Load NVM
. ~/.nvm/nvm.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
