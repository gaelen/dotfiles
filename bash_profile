
ulimit -n 1024

source ~/.bash_aliases
source ~/.bash_exports
source ~/.bash_functions
source ~/.bash_prompt

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Path updates
export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=~/node_modules/.bin:/usr/local/share/npm/bin:$PATH

# For go get
export GOROOT=`go env GOROOT`
export GOPATH=~/workspace/gocode
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$GOBIN:$PATH

#export PYTHONPATH=/usr/local/lib/python3.3/site-packages/:$PYTHONPATH

# For virtualenv wrapper
export WORKON_HOME=~/workspace/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# For node.js/npm
export NODE_PATH=/usr/local/lib/node_modules

# Completion scripts
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Autojump
if [ -f `brew --prefix`/etc/autojump.sh ]; then
  . `brew --prefix`/etc/autojump.sh
fi

# For more secure ssh keys
eval $(ssh-agent)
function cleanup {
    echo "Killing SSH-Agent"
    kill -9 $SSH_AGENT_PID
}
trap cleanup EXIT

