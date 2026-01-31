# Silence bash deprecation warnings on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# %% Locale issues in macOS Terminal.app with bash shell
# %% -------------------------------------------------------------------------------
# * Run `locale` to see the current locale settings.

# Without this locale setting brew-installed bash complains:
# `-bash: warning: setlocale: LC_COLLATE: cannot change locale (): No such file or directory`
# ! It is a Terminal.app only issue when I tested it on macOS 13.7.8 in
# ! Terminal.app Version 2.13 (447.1). iTerm2 Build 3.6.6 does not have this issue at all.
# * This will propagate to all the other `locale` variables if not set explicitly.
export LANG="en_US.UTF-8"

# Setting LANG as above also sets LC_CTYPE to the same value LC_CTYPE="en_US.UTF-8" but
# bash does not like it and prints:
# `-bash: warning: setlocale: LC_CTYPE: cannot change locale (): Bad file descriptor`
# The "Set locale environment variables on startup" option in Terminal.app
# sets LC_CTYPE to "UTF-8" which solves the error message in Terminal.app.
# However this is not the standard on many Linux systems.
# Commented out since I switched to iTerm2.
# export LC_CTYPE="UTF-8"
# %% -------------------------------------------------------------------------------


if [ -x "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x "/usr/local/bin/brew" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# https://formulae.brew.sh/formula/bash-completion@2
# Enable bash-completion if available, but only if not in posix mode
if ! shopt -oq posix; then
  if command -v brew >/dev/null 2>&1 && [ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]; then
    source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
  elif command -v brew >/dev/null 2>&1 && [ -r "$HOMEBREW_PREFIX/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion"
  fi
fi

CONDA_PREFIX="$HOMEBREW_PREFIX/anaconda3"
__conda_setup="$('${CONDA_PREFIX}/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$CONDA_PREFIX/etc/profile.d/conda.sh" ]; then
    source "$CONDA_PREFIX/etc/profile.d/conda.sh"
  else
    export PATH="$CONDA_PREFIX/bin:$PATH"
  fi
fi
unset __conda_setup