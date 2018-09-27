# Git prompt functionality

# Define the colors used by the prompt
if [[ ! -z $TERM && "$TERM" != "dumb" ]]
then
    T_R=$(tput setaf 1) # Red
    T_B=$(tput setaf 4) # Blue
    T_G=$(tput setaf 2) # Green
    T_Y=$(tput setaf 3) # Yellow
    T_S=$(tput sgr0)    # Reset
else
    # We've probably been invoked by an SSH command, there's no terminal
    # to deal with. Don't bother coloring the prompt.
    T_R=''
    T_B=''
    T_G=''
    T_Y=''
    T_S=''
fi

# Define a default prompt string
export PS1='\$ '

# Define a default __git_ps1 in case we don't have git prompt functionality
__git_ps1()
{
    :
}

# Import the Git prompt shell functions. These can be found
# @github:git/git/contrib/completion/git_prompt.sh
if [ -f $HOME/.git_prompt.sh ]; then
    source $HOME/.git_prompt.sh
fi

# Prompt header function, prints user, hostname and current directory
prompt_header()
{
    local last_result="$?"

    echo
    echo -ne "${T_Y}$(date '+%F %T')${T_S} "
    echo -ne "${T_B}${USER}@${HOSTNAME} ${T_S}[${T_G}$(smartwd)${T_S}]"
    if [[ $last_result != 0 ]]
    then
        echo -ne " ${T_R}!! ${last_result} !!${T_S} "
    fi
    echo

    # Configuration for __git_ps1
    GIT_PS1_SHOWCOLORHINTS=yes
    GIT_PS1_SHOWDIRTYSTATE=yes
    GIT_PS1_SHOWUNTRACKEDFILES=yes
    GIT_PS1_SHOWUPSTREAM=verbose
    __git_ps1 '' '\$ ' '(%s)'
}

if [[ ! -z $TERM && "$TERM" != "dumb" ]]
then
    export PROMPT_COMMAND='prompt_header'
fi
