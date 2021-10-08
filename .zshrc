# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/alban/.oh-my-zsh"
export GPG_TTY=$TTY

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Displaying MotD
run-parts /etc/update-motd.d/

# Loading Custom Aliases ...
[[ ! -f ~/.aliases ]] || source ~/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Loading the SSH key(s) using KeyChain.
[[ ! -f ~/.ssh/id_ed25519_albandaquino_gmail.pem ]] || /usr/bin/keychain -q ~/.ssh/id_ed25519_albandaquino_gmail.pem
[[ ! -f ~/.ssh/id_rsa_alban_desktop-ori7896.pem ]] || /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896.pem
# For WSL (Debian, Ubuntu, ...)
[[ ! -f ~/.keychain/DESKTOP-ORI7896-sh ]] || source ~/.keychain/DESKTOP-ORI7896-sh
# For my Zorin OS Virtual Machine
[[ ! -f ~/.keychain/zorinos-vmw-sh ]] || source ~/.keychain/zorinos-vmw-sh

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
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
