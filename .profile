
ulimit -n 1024

source ~/.bash_aliases
source ~/.bash_exports
source ~/.bash_functions
source ~/.bash_prompt

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/share/python:/usr/local/share/python3

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
