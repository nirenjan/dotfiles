#######################################################################
# Add path entries
#######################################################################
function add_to_path {
    if [[ ! ${path[(r)$1]} == $1 ]]
    then
        path=($1 $path)
    fi
}

add_to_path $HOME/bin

#######################################################################
# Plugins
#######################################################################
autoload -U add-zsh-hook
fpath+="$HOME/.zshrc.d/functions"

setopt nullglob
for plugin in $HOME/.zshrc.d/*.zsh
do
    source $plugin
done
setopt nonullglob


# Additional options
setopt autocd extendedglob nomatch notify
