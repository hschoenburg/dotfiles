source ~/.profile # Get the paths
source ~/.bashrc  # get aliases

alias roadmdm='ssh tlm@198.199.92.27'


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
