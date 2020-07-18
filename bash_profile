
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
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# Python linking
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"

# For virtualenv wrapper
export WORKON_HOME=~/.pyenv

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Don't autocomplete tab on empty line
shopt -s no_empty_cmd_completion

# Ruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Completion scripts
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1
