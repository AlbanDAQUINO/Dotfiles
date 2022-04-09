# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\[\e]0;\u@\h: \w\a\]\[\e[1;36m\]\@\[\e[00m\] : \[\e[34m\]\w\[\e[00m\] \n \[\e[1;32m\]\u @\h\[\e[00m\] \$\[\e[m\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if PowerLine is present, load it.
if [ -f ~/.bash-powerline.sh ] ; then
    . ~/.bash-powerline.sh
fi

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Loading the SSH key(s) using KeyChain.
[ -f ~/.ssh/id_rsa_alban_desktop-ori7896 ] && /usr/bin/keychain -q --nogui ~/.ssh/id_rsa_alban_desktop-ori7896
[ -f ~/.ssh/id_ed25519_albandaquino_gmail ] && /usr/bin/keychain -q ~/.ssh/id_ed25519_albandaquino_gmail
[ -f ~/.ssh/id_ed25519_alban_devops ] && /usr/bin/keychain -q ~/.ssh/id_ed25519_alban_devops
[ -f ~/.ssh/id_ed25519_groot ] && /usr/bin/keychain -q ~/.ssh/id_ed25519_groot
# For WSL (Debian, Ubuntu, ...)
[ -f ~/.keychain/DESKTOP-ORI7896-sh ] && source ~/.keychain/DESKTOP-ORI7896-sh

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

# Shell Greetings
colorscript -e crunchbang-mini
lsb_release -ds | figlet -t -f digital
