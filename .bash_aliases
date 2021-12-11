#! /bin/sh

# Removing all previous set of aliases
unalias -a

# APT
if [[ -f /usr/bin/apt ]]; then
  alias aptupdate='sudo apt update'
  alias aptupgrade='sudo apt upgrade'
  alias aptsearch='apt search'
  alias aptinstall='sudo apt install'
  alias aptremove='sudo apt remove --purge'
  alias aptclean='sudo apt autoremove --purge'
fi

# PACMAN
if [[ -f /usr/bin/pacman ]]; then
  alias pacupdate='sudo pacman -Sy'
  alias pacinstall='sudo pacman -S'
  alias pacsearch='sudo pacman -Ss'
  alias pacshow='sudo pacman -Si'
  alias pacinstalled='sudo pacman -Qs'
  alias pacshowinstalled='sudo pacman -Qi'
fi

# Shell - Common
alias cls='clear'
alias 'cd..'='cd ..'
alias '..'='cd ..'
alias '..2'='cd ../..'
alias '..3'='cd ../../..'
alias ls='ls -AGlhv --color=auto'
alias ll='ls'

# Shell -  Flags
alias cp='cp -i'
alias df='df -h'
if [[ -f /usr/bin/wget ]]; then
  alias wget='wget -c'
fi

# Shell - Banner
if [[ -d /etc/update-motd.d/ ]]; then
  alias banner='clear && run-parts /etc/update-motd.d'
fi

# Shell - Adding Some Color
## Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
## ScreenFetch
if [[ -f /usr/bin/screenfetch ]]; then
  alias sf='screenfetch'
fi
## HighLight
if [[ -f /usr/bin/highlight ]]; then
  alias cat='highlight -O ansi --force'
fi
## Exa
if [[ -f /usr/bin/exa ]]; then
  alias ll='exa -al --tree --level=1'
  alias lli='exa -al --tree --level=1 --icons'
  alias la='exa -ahl --group-directories-first --sort=name'
  alias l.='exa -a --group-directories-first --sort=name | egrep "^\."'
fi
## Colorscript
if [[ -f /usr/bin/colorscript ]]; then
  alias cls='clear && colorscript -e crunchbang-mini'
  alias randomcolors='colorscript -r'
fi

# Shell - Yadm
if [[ -f /usr/bin/yadm ]]; then
  alias ystatus='yadm status'
  alias yfetch='yadm fetch'
  alias ycommit='yadm commit -m'
  alias ypush='yadm push'
  alias ypull='yadm pull'
  alias yadd='yadm add'
fi

# Git
if [[ -f /usr/bin/git ]]; then
  alias gitview='git log --oneline --decorate --graph --all'
  alias gaddup='git add -u'
  alias gaddall='git add .'
  alias gbranch='git branch'
  alias gcheckout='git checkout'
  alias gclone='git clone'
  alias gcommit='git commit -m'
  alias gfetch='git fetch'
  alias gpull='git pull origin'
  alias gpush='git push origin'
  alias gs='git status' # STATUS is protected.
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
  # Hmmm ...
  alias tryolo='cls && echo "Terraform YOLO ! ---" && terraform init && terraform fmt && terraform validate && terraform plan -out "yolo.tfplan" && terraform apply "yolo.tfplan"'
  alias trboom='terraform destroy --auto-approve'
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

# Resources - Service
if [[ -f /etc/wsl.conf ]]; then
  alias srvall='sudo service --status-all'
  alias srvrunning='srvall | grep -e " + "'
  alias srvstopped='srvall | grep -e " - "'
fi

# Resources - Systemd
if [[ ! -f /etc/wsl.conf ]]; then
  alias srvstatus='sudo systemctl status'
  alias srvreload='sudo systemctl reload'
  alias srvstart='sudo systemctl start'
  alias srvstop='sudo systemctl stop'
fi

# Misc.
## Youtube Download
if [[ -f /usr/bin/youtube-dl ]]; then
  alias yta-aac='youtube-dl --extract-audio --audio-format aac'
  alias yta-best='youtube-dl --extract-audio --audio-format best'
  alias yta-flac='youtube-dl --extract-audio --audio-format flac'
  alias yta-m4a='youtube-dl --extract-audio --audio-format m4a'
  alias yta-mp3='youtube-dl --extract-audio --audio-format mp3'
  alias yta-opus='youtube-dl --extract-audio --audio-format opus'
  alias yta-vorbis='youtube-dl --extract-audio --audio-format vorbis'
  alias yta-wav='youtube-dl --extract-audio --audio-format wav'
  alias ytv-best='youtube-dl -f bestvideo+bestaudio'
fi
