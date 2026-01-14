# HISTORY
#
# Where to save history
HISTFILE=~/.histfile
# Maximum history events to store internally
HISTSIZE=1000
# Maximum history events to store in the history file
SAVEHIST=$HISTSIZE
# Import history from file, allows to share history between multiple shell processes
setopt SHARE_HISTORY
# Do not save command to history if it a duplicate of a previous one
setopt HIST_IGNORE_DUPS

# OPTIONS
#
# If the command entered is an exact match of an existing directory, cd into that directory
setopt AUTO_CD
# Try to correct misspelled commands
setopt CORRECT
# Set emacs mode
# For example CTRL+A will take you to the beginning of the line,
# CRTL+U will delete everything to the beginning of the line etc.
bindkey -e

# Edit command buffer
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x' edit-command-line

autoload zmv
