#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v2.1.20
#
# This is just my zshenv file...
# Note(s): Global Order: zshenv, zprofile, zshrc, zlogin

## PATH
if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
        export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
fi

## Exports
# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share/
# Starship
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
export STARSHIP_CACHE=$HOME/.config/starship/cache
# Zsh
export ZDOTDIR=$HOME/.config/zsh

