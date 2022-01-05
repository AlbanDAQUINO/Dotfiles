#!/bin/zsh
# 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/alban/.oh-my-zsh"
export GPG_TTY=$TTY

# Set name of the theme to load (See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration
# Colormap / Usage: colormap
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

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
    *windows*                ICON="";;
    *)                       ICON="";;
esac

# Loading Custom Aliases ...
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

# Displaying MotD
run-parts /etc/update-motd.d/

# Loading the SSH key(s) using KeyChain.
[[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q ~/.ssh/id_rsa_alban_desktop-ori7896.pem              # Under..!
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
