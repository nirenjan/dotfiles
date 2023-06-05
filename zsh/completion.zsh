#######################################################################
# ZSH Completion
#######################################################################
zstyle :compinstall filename '/home/nkrishnan/.zshrc'

autoload -Uz compinit
compinit

#######################################################################
# ZSH Command suggestions
#######################################################################
# This is only valid on Ubuntu, I haven't found a Mac OS equivalent
if [[ -e /etc/zsh_command_not_found ]]
then
    source /etc/zsh_command_not_found
fi
