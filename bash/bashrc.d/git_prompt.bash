# Git prompt functionality

# Define the colors used by the prompt
if [[ ! -z $TERM && "$TERM" != "dumb" ]]
then
    T_B=$(tput setaf 4) # Blue
    T_G=$(tput setaf 2) # Green
    T_Y=$(tput setaf 3) # Yellow
    T_S=$(tput sgr0)    # Reset
else
    # We've probably been invoked by an SSH command, there's no terminal
    # to deal with. Don't bother coloring the prompt.
    T_B=''
    T_G=''
    T_Y=''
    T_S=''
fi

# Import the Git prompt shell functions. These can be found
# @github:git/git/contrib/completion/git_prompt.sh
if [ -f $HOME/.git_prompt.sh ]; then
    source $HOME/.git_prompt.sh
    export PS1='\[$T_B\]\u@\h \[$T_S\][\[$T_G\]$(smartwd)$(__git_ps1 " \[$T_Y\](%s)")\[$T_S\]]\$ '
else
    export PS1='\[$T_B\]\u@\h \[$T_S\][\[$T_G\]$(smartwd)\[$T_S\]]\$ '
fi
