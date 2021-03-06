# Add ls coloring
# Don't bother setting LS_COLORS if it's alredy set
if [[ -n "$LS_COLORS" ]]
then
    return
fi

if [[ "`uname`" == *"Darwin"* ]]
then
    # OS X uses BSD ls which is relatively restricted compared to
    # GNU ls as far as coloring options go. Stick to the basics here.
    # LSCOLORS is in pairs (fgcolor, bgcolor)

    # Colorscheme for LSCOLORS (BSD)
    # a => black    A => dark gray
    # b => red      B => bold red
    # c => green    C => bold green
    # d => brown    D => yellow
    # e => blue     E => bold blue
    # f => magenta  F => bold magenta
    # g => cyan     G => bold cyan
    # h => gray     H => white
    # x => default

    # Ordering for LSCOLORS(BSD)
    # 1. directory
    # 2. symbolic link
    # 3. socket
    # 4. pipe
    # 5. executable
    # 6. block device
    # 7. character device
    # 8. executable with setuid set
    # 9. executable with setguid set
    # 10. directory writable by others, with sticky bit
    # 11. directory writable by others, without sticky bit

    export LSCOLORS="ExGxbxdxCxegedabagacad"

    # Must use either CLICOLOR=1 or ls -G
    export CLICOLOR=1
fi

DCFILE="$HOME/.dircolors"

# We can presume we are on a GNU system, or at the very least,
# a system which has the GNU coreutils installed
if [[ -f $DCFILE ]] && [[ -s $DCFILE ]]
then
    if [[ ! -z `which dircolors` ]]
    then
        eval `dircolors $DCFILE`
    elif [[ ! -z `which gdircolors` ]]
    then
        # OS X with coreutils installed from MacPorts will have
        # dircolors installed by default as gdircolors.
        eval `gdircolors $DCFILE`
    fi
fi
