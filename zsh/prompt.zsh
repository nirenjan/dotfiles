#######################################################################
# Git prompt functionality
#######################################################################
# Define a default __git_ps1 in case we don't have git prompt functionality
function __git_ps1
{
    :
}

# Import the Git prompt shell functions. These can be found
# @github:git/git/contrib/completion/git_prompt.sh
if [ -f $HOME/.git_prompt.sh ]; then
    source $HOME/.git_prompt.sh
fi

# Prompt header function, prints user, hostname and current directory
function prompt_header
{
    # Build the prompt prefix
    local prefix
    # Add the current date in YYYY-MM-DD HH:MM:SS format (yellow color)
    prefix='%F{yellow}%D{%F %T}%f' 
    # Add <user>@<hostname> (blue color)
    prefix="$prefix %F{blue}%n@%m%f"
    # Add current working directory (green color)
    # This replaces the smartwd functionality with zsh conditionals
    prefix="$prefix [%F{green}%(6~#%-3~/.../%2~#%~)%f]"
    # Add the status of the last command, but only if it failed
    prefix="$prefix %(?..%F{red}!! %? !!%f)"

    # Configuration for __git_ps1
    GIT_PS1_SHOWCOLORHINTS=yes
    GIT_PS1_SHOWDIRTYSTATE=yes
    GIT_PS1_SHOWUNTRACKEDFILES=yes
    GIT_PS1_SHOWUPSTREAM=verbose
    __git_ps1 $'\n'$prefix$'\n' '%# ' '(%s)'
}

if [[ ! -z $TERM && "$TERM" != "dumb" ]]
then
    add-zsh-hook precmd 'prompt_header'
fi
