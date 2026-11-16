# ~/.zshrc: zsh-only settings (macOS). Shared config lives in ~/.dotfiles/shell/.

# History: skip duplicates and lines starting with a space, append rather than
# overwrite (matches bashrc).
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt APPEND_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Tab completion.
autoload -Uz compinit && compinit

# Prompt: user:dir$ (matches bashrc).
PROMPT='%n:%~%# '

for f in ~/.dotfiles/shell/*.sh; do
  . "$f"
done
unset f
