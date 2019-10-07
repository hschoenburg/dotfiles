source ~/.profile # Get the paths
source ~/.bashrc  # get aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dolokhov/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/dolokhov/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dolokhov/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/dolokhov/Downloads/google-cloud-sdk/completion.bash.inc'; fi
