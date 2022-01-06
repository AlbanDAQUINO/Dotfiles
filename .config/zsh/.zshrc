#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v2.1.18
#
# This is just my zshrc file...

### Exports
export EDITOR="nvim"
# export TERM="xterm-256color"
export GPG_TTY=$TTY

# History
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PATH
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### Zsh
# Which plugins would you like to load?
source ~/.config/zsh/plugins/zsh-autosuggestion.zsh
source ~/.config/zsh/plugins/simple-completion.zsh

### Function extract for common file formats ###
# Set a name based on the distro
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
# Set an icon based on the distro
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
# Export the distro icon
export STARSHIP_DISTRO=" $ICON"

# Archive Extraction / usage: ex <file>
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

# Colormap / Usage: colormap
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

### Loading Custom Aliases ...
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases
[[ ! -f ~/.config/zsh/.zshrc ]] || alias rlzsh='source ~/.config/zsh/.zshrc'

### Zsh - Prompt
eval "$(starship init zsh)"

# Displaying MotD
run-parts /etc/update-motd.d/

# Loading the SSH key(s) using KeyChain.
[[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896.pem      # Under..!
[[ ! -f ~/.ssh/id_ed25519_alban_cdiscount.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_cdiscount.pem          # Under..Mo!
[[ ! -f ~/.ssh/id_ed25519_alban_desktop-hp6740.pem ]] || /usr/bin/keychain -q ~/.ssh/id_ed25519_alban_desktop-hp6740.pem        # UnderKiMo..!
[[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_albandaquino_gmail.pem    # Ori..
[[ ! -f ~/.ssh/id_rsa_albandaquino_cdiscount.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_albandaquino_cdiscount.pem    # Ori..!
[[ ! -f ~/.ssh/id_ed25519_alban_devops.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_ed25519_alban_devops.pem                # Ori..!

# For my WSLs (Debian, Ubuntu, ...)
[[ ! -f ~/.keychain/DESKTOP-ORI7896-sh ]] || source ~/.keychain/DESKTOP-ORI7896-sh
# For my Zorin OS Virtual Machine
[[ ! -f ~/.keychain/zorinos-vmw-sh ]] || source ~/.keychain/zorinos-vmw-sh
# For my C-Discount Work Computer
[[ ! -f ~/.keychain/CL-3GKR3F3-sh ]] || source ~/.keychain/CL-3GKR3F3-sh
