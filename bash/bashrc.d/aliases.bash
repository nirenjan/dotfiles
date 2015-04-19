# Source the common aliases across systems
# ls aliases
alias ll='ls -l'

# Git aliases
alias tgp='time git pull'
alias gf='git fetch'

# Tmux aliases
# Use this to launch in 256-color mode
alias tmux='TERM=screen-256color-bce tmux -2 -u'
# Attach to an existing tmux session
alias work='TERM=screen-256color-bce tmux -2 -u attach -d'
# Trigger tmux to reopen the socket if it cannot attach
alias kick='pkill -USR1 -u $USER tmux'

# Keep system specific aliases in a seperate file called .aliases
# If .aliases exists it will envoked by the next line:
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases 
fi
