
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
export PATH=/usr/local/share/npm/bin:$PATH

#export PYTHONPATH=/usr/local/lib/python3.3/site-packages/:$PYTHONPATH

# For virtualenv wrapper
export WORKON_HOME=~/.virtualenvs

# Ruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Completion scripts
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Autojump
if [ -f `brew --prefix`/etc/autojump.sh ]; then
  . `brew --prefix`/etc/autojump.sh
fi

# For more secure ssh keys
#eval $(ssh-agent) >> /dev/null
#function cleanup {
#    kill -9 $SSH_AGENT_PID
#}
#trap cleanup EXIT
export SSH_AUTH_SOCK=$(launchctl getenv SSH_AUTH_SOCK)

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

