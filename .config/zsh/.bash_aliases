#!/bin/sh
# 
#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v6.7.3
#
# Bash Aliases

# Removing all previous set of aliases
unalias -a

# APT
if [ -f /usr/bin/apt ]; then
  alias apt_update='sudo apt update'
  alias apt_upgrade='sudo apt update && sudo apt upgrade'
  alias apt_install='sudo apt install'
  alias apt_search='apt search'
  alias apt_show='sudo apt show'
  alias apt_installed='sudo apt list --installed'
  alias apt_remove='sudo apt remove --purge'
  alias apt_clean='sudo apt autoremove --purge'
  alias apt_infos='sudo apt --version'
fi

# APTitude
if [ -f /usr/bin/aptitude ]; then
  alias aptd_update='sudo aptitude update'
  alias aptd_upgrade='sudo aptitude upgrade'
  alias aptd_install='sudo aptitude install'
  alias aptd_search='aptitude search'
  alias aptd_show='sudo aptitude show'
  alias aptd_remove='sudo aptitude purge'
  alias aptd_infos='sudo aptitude --version'
fi

# Nala
if [ -f /usr/bin/nala ]; then
  alias nala_update='sudo nala upgrade'
  alias nala_upgrade='sudo nala upgrade'
  alias nala_install='sudo nala install'
  alias nala_search='nala_update && nala search'
  alias nala_show='nala_update && nala show'
  alias nala_installed='sudo nala list --installed'
  alias nala_remove='sudo nala purge'
  alias nala_clean='sudo nala autoremove'
  alias nala_infos='nala show nala'
fi

# PACMAN
if [ -f /usr/bin/pacman ]; then
  alias pac_update='sudo pacman -Sy'
  alias pac_upgrade='sudo pacman -Syyu'
  alias pac_install='sudo pacman -S'
  alias pac_search='sudo pacman -Ss'
  alias pac_show='sudo pacman -Si'
  alias pac_installed='sudo pacman -Qs'
  alias pac_showinstalled='sudo pacman -Qi'
  alias pac_remove='sudo pacman -Rs'
  alias pac_cleanremove='sudo pacman -Rsn'
  alias pac_infos='sudo pacman --version'
fi

# YAY
if [ -f /usr/bin/yay ]; then
  alias yay_update='yay -Sy'
  alias yay_upgrade='yay -Syyu'
  alias yay_install='yay -S'
  alias yay_search='yay -Ss'
  alias yay_show='yay -Si'
  alias yay_installed='yay -Qs'
  alias yay_showinstalled='yay -Qi'
  alias yay_remove='yay -Rs'
  alias yay_cleanremove='yay -Rsn'
  alias yay_infos='yay -Ps'
fi

# Shell - Common
alias cls='clear'
alias 'cd..'='cd ..'
alias '..'='cd ..'
alias '..2'='cd ../..'
alias '..3'='cd ../../..'
alias '..4'='cd ../../../..'
alias '..5'='cd ../../../../..'
alias ls='ls -AGlhv --color=auto'
alias ll='ls'

# Shell -  Flags
alias cp='cp -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias df='df -h'
if [ -f /usr/bin/wget ]; then
  alias wget='wget -cv'
fi

# Shell - GPG
if [ -f /usr/bin/gpg ]; then
  alias gpgtest='echo "test" | gpg --clearsign'
  alias gpgdecrypt='gpg --decrypt-files'
  alias gpgencrypt='gpg --default-recipient-self --armor --encrypt-files'
fi

# Shell - Adding Some Color
## BatCat
if [ -f /usr/bin/batcat ]; then
  alias cat='batcat --style=plain --paging=never'
  alias bcat='batcat'
fi
## Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
## Exa
if [ -f /usr/bin/exa ]; then
  alias ls='exa --icons --group-directories-first --sort=name'
  alias ll='exa -l --tree --level=1 --group-directories-first --sort=name'
  alias lla='exa -al --tree --level=1 --group-directories-first --sort=name'
  alias lli='exa -al --tree --level=1 --group-directories-first --sort=name --icons'
  alias la='exa -alh --group-directories-first --sort=name'
  alias lc='exa --icons -a --group-directories-first --sort=name'
  alias l.='exa -a --group-directories-first --sort=name | egrep "^\."'
fi
## Tree
if [ -f /usr/bin/tree ]; then
  alias tree='/usr/bin/tree -I .git -I .terraform -I terraform.tfstate -I terraform.tfstate.backup -I .terraform.lock.hcl -C -L'
  alias treeall='/usr/bin/tree -a -I .git -I .terraform -I terraform.tfstate -I terraform.tfstate.backup -I .terraform.lock.hcl -C -L'
fi

# Git
if [ -f /usr/bin/git ]; then
  alias ggraph='git log --oneline --decorate --graph --all'
  alias gaddup='git add -u'
  alias gaddall='git add .'
  alias gbranch='git branch'
  alias gcheckout='git checkout'
  alias gclone='git clone'
  alias gcommit='git commit -m'
  alias gfetch='git fetch'
  alias gpull='git pull origin'
  alias gpush='git push'
  alias gpushb='git push --set-upstream origin'
  alias gstatus='git status'
  alias gtag='git tag'
  alias gnewtag='git tag -a'
fi

# Terraform
if [ -f /usr/bin/terraform ]; then
  alias trplan='terraform plan'
  alias trformat='terraform fmt'
  alias trplanf='terraform plan -out'
  alias trapply='terraform apply'
  alias trlist='terraform state list'
  alias trshow='terraform state show'
  alias trko='terraform destroy'
  alias terrafull='echo "Terraform Full (Format, Validate, Plan) ---" && terraform init && terraform fmt && terraform validate && terraform plan -out'
fi

# Resources - CPU
alias ps='ps -afux'
alias zombies='/bin/ps -A -ostat,pid,ppid | grep -e "[zZ]"'

# Resources - Network
alias openport='sudo ss -tupln'
alias ping='echo "--- Pinging 3 times ---" && sudo /bin/ping -a -c 3'
alias ssht='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# Resources - Doas
# if [ -f /usr/bin/doas && -f /etc/doas.conf ]; then
#   alias sudo="doas"
# fi

# Resources - Hardware informations
if [ -f /usr/bin/inxi ]; then
  alias hwinfos='inxi -CGxxxz --display'
  alias sysinfos='inxi -v1G --display'
fi

# Resources - Service
if [ -f /etc/wsl.conf ]; then
  alias srvsall='sudo service --status-all'
  alias srvrunning='srvstatus | grep -e " + "'
  alias srvstopped='srvstatus | grep -e " - "'
  # alias srvreload=''
  # alias srvstart=''
  # alias srvstop=''
  # alias srvrestart=''
fi

# Resources - Systemd
if [ -f /bin/systemctl ]; then
  # Lists
  alias sctlall='sudo systemctl list-units --type=service | egrep " active"'
  alias sctlrunning='sudo systemctl list-units --type=service | egrep " running"'
  alias sctlstopped='sudo systemctl list-units --type=service | egrep " exited"'
  # Commands
  alias sctlstatus='sudo systemctl status --no-pager'
  alias sctlstart='sudo systemctl start'
  alias sctlstop='sudo systemctl stop'
  alias sctlreload='sudo systemctl reload'
  alias sctlrestart='sudo systemctl restart'
fi

# Misc.
