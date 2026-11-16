# shellcheck shell=sh
# Aliases shared by bash and zsh. Sourced into the interactive shell, so keep
# this POSIX sh and don't use `set -e` or `set -u`.

# GNU ls (Linux) takes --color; older BSD ls (macOS) uses -G instead.
if ls --color=auto -d . >/dev/null 2>&1; then
  alias ls='ls -lF --color=auto'
else
  alias ls='ls -lFG'
fi
alias ll='ls -alF'
alias la='ls -a'
alias l='ls -CF'
alias grep='grep --color=auto -n'

# Directory sizes, largest first. GNU du -S excludes subdirectories from each
# total; BSD du (macOS) has no equivalent, so it falls back to full totals.
if du -S -d 0 . >/dev/null 2>&1; then
  alias diskspace='du -S | sort -n -r | more'
else
  alias diskspace='du -k | sort -n -r | more'
fi
