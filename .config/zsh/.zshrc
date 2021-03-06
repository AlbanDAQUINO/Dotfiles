#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v2.1.22
#
# This is just my zshrc file...

# Exports
export EDITOR="nvim"
## export TERM="xterm-256color"
export GPG_TTY=$TTY

## History
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

## If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PATH
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Zsh
## Which plugins would you like to load?
source $ZDOTDIR/plugins/zsh-autosuggestion.zsh
source $ZDOTDIR/plugins/simple-completion.zsh

## Function extract for common file formats ###
### Set a name based on the distro
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
### Set an icon based on the distro
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *windows*)               ICON="";;
    *)                       ICON="";;
esac
### Export the distro icon
export STARSHIP_DISTRO="$ICON"

## Archive Extraction / usage: ex <file>
function ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *)           echo "'$1' cannot be extracted via ex()." ;;
    esac
  else
    echo "'$1' is not a valid file."
  fi
}

## Colormap / Usage: colormap
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

## Loading Custom Aliases ...
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases
[[ ! -f $ZDOTDIR/.zshrc ]] || alias rlzsh='source $ZDOTDIR/.zshrc'

## Zsh - Prompt
eval "$(starship init zsh)"

# Displaying MotD
run-parts /etc/update-motd.d/

# SSH / Keychain - Offering to unlock the keys
if [ -f $ZDOTDIR/kunlock.sh ]; then
  ~/.config/zsh/kunlock.sh
  # For my WSLs (Debian, Ubuntu, ...)
  if [ -f $HOME/.keychain/DESKTOP-ORI7896-sh ]; then source $HOME/.keychain/DESKTOP-ORI7896-sh; fi
  # For my WSLs (Debian, Ubuntu, ...)
  if [ -f $HOME/.keychain/desktop-hp6740-sh ]; then source $HOME/.keychain/desktop-hp6740-sh; fi
  # For my C-Discount Work Computer
  if [ -f $HOME/.keychain/CL-3GKR3F3-sh ]; then source $HOME/.keychain/CL-3GKR3F3-sh; fi
  # Display a console message
  if [ $SSH_AGENT_PID != "" ]; then
    echo "└─ Found SSH_Agent (PiD: $SSH_AGENT_PID) " 
  else
    echo "└─ SSH_Agent not found! " 
  fi
fi
