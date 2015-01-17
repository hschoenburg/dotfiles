##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=/usr/local/bin:$PATH
    export PATH
fi

echo $PATH | grep -q -s "/usr/local/sbin"
if [ $? -eq 1 ] ; then
    PATH=/usr/local/sbin:$PATH
    export PATH
fi

echo $PATH | grep -q -s "/usr/local/share/npm/bin"
if [ $? -eq 1 ] ; then
  PATH=$PATH:/usr/local/share/npm/bin
  export PATH
fi

# [[ -s /usr/local/bin/src-hilite-lesspipe.sh ]] && export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS="-R#3m~gQ"
export GOPATH="$HOME/go"
# export EDITOR="/usr/local/bin/vim"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
