# Enable bash-completion if available, but only if not in posix mode
if ! shopt -oq posix; then
  # Debian/Ubuntu common locations
  if [ -r "/usr/share/bash-completion/bash_completion" ]; then
    source "/usr/share/bash-completion/bash_completion"
  elif [ -r "/etc/bash_completion" ]; then
    source "/etc/bash_completion"
  fi
fi