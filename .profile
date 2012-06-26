
ulimit -n 1024

source ~/.bash_aliases
source ~/.bash_exports
source ~/.bash_functions
source ~/.bash_prompt

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Path updates
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/share/python:/usr/local/share/python3
export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p194/bin

# For node.js/npm
export NODE_PATH=/usr/local/lib/node_modules

# Completion scripts
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

