
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
export PATH=/usr/local/share/npm/bin:$PATH


# Something for gnutls
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

# Python built-in venv helper
export WORKON_HOME=~/.python_venv
eval "$(direnv hook bash)"

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

# Kitty Completion
# source <(kitty + complete setup bash)

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1
