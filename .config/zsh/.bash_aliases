#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v6.6.3
#
# Bash Aliases

# Removing all previous set of aliases
unalias -a

# APT
if [[ -f /usr/bin/apt ]]; then
  alias aptupdate='sudo apt update'
  alias aptupgrade='sudo apt upgrade'
  alias aptinstall='sudo apt install'
  alias aptsearch='apt search'
  alias aptshow='sudo apt show'
  alias aptinstalled='aptshow'
  alias aptshowinstalled='sudo apt list --installed'
  alias aptremove='sudo apt remove --purge'
  alias aptclean='sudo apt autoremove --purge'
  alias aptinfos='sudo apt --version'
fi

# APTitude
if [[ -f /usr/bin/aptitude ]]; then
  alias aptdupdate='sudo aptitude update'
  alias aptdupgrade='sudo aptitude upgrade'
  alias aptdinstall='sudo aptitude install'
  alias aptdsearch='aptitude search'
  alias aptdshow='sudo aptitude show'
  alias aptdinstalled='aptshow'
  # alias aptshowinstalled='sudo aptitude list --installed'
  alias aptdremove='sudo aptitude purge'
  alias aptdinfos='sudo aptitude --version'
fi

# Nala
if [[ -f /usr/bin/nala ]]; then
  alias nlaupdate='sudo nala update'
  alias nlaupgrade='sudo nala upgrade'
  alias nlainstall='sudo nala install'
  alias nlasearch='nala search'
  alias nlashow='nala show'
  # alias nlainstalled='nashow'
  # alias nlashowinstalled='sudo nala list --installed'
  alias nlaremove='sudo nala remove'
  alias nlaclean='sudo nala purge'
  alias nlainfos='nala show nala'
fi

# PACMAN
if [[ -f /usr/bin/pacman ]]; then
  alias pacupdate='sudo pacman -Sy'
  alias pacupgrade='sudo pacman -Syyu'
  alias pacinstall='sudo pacman -S'
  alias pacsearch='sudo pacman -Ss'
  alias pacshow='sudo pacman -Si'
  alias pacinstalled='sudo pacman -Qs'
  alias pacshowinstalled='sudo pacman -Qi'
  alias pacremove='sudo pacman -Rs'
  alias paccleanremove='sudo pacman -Rsn'
  alias pacinfos='sudo pacman --version'
fi

# YAY
if [[ -f /usr/bin/yay ]]; then
  alias yayupdate='yay -Sy'
  alias yayupgrade='yay -Syyu'
  alias yayinstall='yay -S'
  alias yaysearch='yay -Ss'
  alias yayshow='yay -Si'
  alias yayinstalled='yay -Qs'
  alias yayshowinstalled='yay -Qi'
  alias yayremove='yay -Rs'
  alias yaycleanremove='yay -Rsn'
  alias yayinfos='yay -Ps'
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
alias cp='cp -i'
alias df='df -h'
alias mkdir='mkdir -pv'
if [[ -f /usr/bin/wget ]]; then
  alias wget='wget -c'
fi

# Shell - Adding Some Color
## Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
## HighLight
if [[ -f /usr/bin/highlight ]]; then
  alias cat='highlight -O ansi --force'
fi
## Exa
if [[ -f /usr/bin/exa ]]; then
#  alias ll='exa -al --tree --level=1'
  alias ll='exa -al --tree --level=1 --group-directories-first --sort=name'
  alias lli='exa -al --tree --level=1 --group-directories-first --sort=name --icons'
  alias la='exa -ahl --group-directories-first --sort=name'
  alias lc='exa --icons -a --group-directories-first'
  alias l.='exa -a --group-directories-first --sort=name | egrep "^\."'
fi
## Tree
if [[ -f /usr/bin/tree ]]; then
  alias tree='/usr/bin/tree -a -I .git -I .terraform -I terraform.tfstate -I terraform.tfstate.backup -I .terraform.lock.hcl -C -L'
fi

# Git
if [[ -f /usr/bin/git ]]; then
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
if [[ -f /usr/bin/terraform ]]; then
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

## Top process(es) eating memory
alias psmem='/bin/ps -afux | sort -nr -k 4'
alias psmem10='/bin/ps -afux | sort -nr -k 4 | head -10'
## Top process(es) eating cpu
alias pscpu='/bin/ps -afux | sort -nr -k 3'
alias pscpu10='/bin/ps -afux | sort -nr -k 3 | head -10'

# Resources - Network
alias openport='sudo ss -tupln'
alias ping='echo "--- Pinging 3 times ---" && sudo /bin/ping -a -c 3'
alias ssht='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# Resources - Doas
# if [[ -f /usr/bin/doas && -f /etc/doas.conf ]]; then
#   alias sudo="doas"
# fi

# Resources - Hardware informations
if [[ -f /usr/bin/inxi ]]; then
  alias hwinfos='inxi -CGxxxz --display'
  alias sysinfos='inxi -v1G --display'
fi

# Resources - Service
if [[ -f /etc/wsl.conf ]]; then
  alias srvstatus='sudo service --status-all'
  alias srvrunning='srvstatus | grep -e " + "'
  alias srvstopped='srvstatus | grep -e " - "'
  # alias srvreload=''
  # alias srvstart=''
  # alias srvstop=''
  # alias srvrestart=''
fi

# Resources - Systemd
if [[ -f /bin/systemctl && ! -f /etc/wsl.conf ]]; then
  alias sctlstatus='sudo systemctl list-units --type=service | egrep " active"'
  alias sctlrunning='sudo systemctl list-units --type=service | egrep " running"'
  alias sctlstopped='sudo systemctl list-units --type=service | egrep " exited"'
  alias sctlshow='sudo systemctl status'
  alias sctlreload='sudo systemctl reload'
  alias sctlstart='sudo systemctl start'
  alias sctlstop='sudo systemctl stop'
  alias sctlrestart='sudo systemctl restart'
fi

# Misc.
