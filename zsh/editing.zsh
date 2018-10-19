#######################################################################
# Key Bindings
#######################################################################
# Use emacs bindings by default
bindkey -e

#######################################################################
# Default Editor and line editing
#######################################################################
export EDITOR=vim

# Emacs style bindings
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

