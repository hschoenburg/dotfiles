source ~/.git-completion.bash

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
fi

#Golang stuff

export GOPATH=$HOME/Work/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE='on'

alias gw='cd $GOPATH/src/github.com'

alias gffm='git fetch && git merge --ff-only'

alias stripcolors='sed "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

alias weechat='ssh root@hans.digital -t screen -D -RR weechat weechat-curses'

alias ccc='clear'

alias grep='GREP_COLOR="1;33" LANG=C grep --color=auto' #use GREP_COLOR=7 to highlight whitespace

# PGSQL
alias pgstop='pg_ctl stop -D /usr/local/var/postgres -m fast'
alias pgstart='pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/log/postgresql.log'

# Mongo
alias mstart='mongod --fork --logpath /usr/local/var/log/mongodb/mongodb.log --pidfilepath /usr/local/var/log/mongodb/mongod.pid'
alias mstarti='mongod --logpath /usr/local/var/log/mongodb/mongodb.log --pidfilepath /usr/local/var/log/mongodb/mongod.pid'
alias mstop='kill `cat /usr/local/var/log/mongodb/mongod.pid`'
alias mrepair='mongod --repair'

# ElasticSearch
alias esstart='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.20.5/config/elasticsearch.yml -p /usr/local/var/log/elasticsearch/elasticsearch.pid > /dev/null &'
alias esstarti='elasticsearch -D es.config=/usr/local/Cellar/elasticsearch/0.20.5/config/elasticsearch.yml -p /usr/local/var/log/elasticsearch/elasticsearch.pid'
alias esstop='kill `cat /usr/local/var/log/elasticsearch/elasticsearch.pid`'

# Redis
alias rstart='redis-server /usr/local/etc/redis.conf'

# Git stuff

alias 'gffm'='git fetch && git merge --ff-only'
alias gl='git pull'
alias gp='git push'
alias gs='git status'
alias gct='git commit'
alias gph='git push heroku'
alias stage='git push staging dev:master'
alias r='rails'
alias dh='cd ~/Sites/dreamhost-files'
# Less is more
alias more='less'

# Parallel versions of gzip and bzip2
alias gzip='pigz'
alias bzip2='pbzip2'

# Prevent resource forks from being tarred
alias tar='COPYFILE_DISABLE=true tar' 

# Go to the source dir for a given bundle or gem
bundlecd () { cd `bundle show $*`; }
gemcd () { cd `gem which $*`; }

# bright prompt with $HOST:$PWD
# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"
PS1="\u $SI\w$NM"'$(__git_ps1 " %s")'"$ $IN"

#I hate noise
set bell-style visible

# Tab completion in rails shell
complete -C rails-complete -o default rails

# Teamocil
#complete -W "$(teamocil --list)" teamocil

# For tmux: Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-tmux"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Node Version Manager
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
