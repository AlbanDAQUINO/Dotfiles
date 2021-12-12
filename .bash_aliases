#! /bin/sh

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
  alias aptcleanremove='sudo apt autoremove --purge'
  alias aptinfos='sudo apt --version'
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
alias ls='ls -AGlhv --color=auto'
alias ll='ls'

# Shell -  Flags
alias cp='cp -i'
alias df='df -h'
if [[ -f /usr/bin/wget ]]; then
  alias wget='wget -c'
fi

# Shell - Banner
if [[ -d ~/.banners/ ]]; then
  alias banner='clear && run-parts ~/.banners'
fi
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
## NeoFetch
if [[ -f /usr/bin/neofetch ]]; then
  alias neof='/usr/bin/neofetch'
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
  alias ggraph='git log --oneline --decorate --graph --all'
  alias gaddup='git add -u'
  alias gaddall='git add .'
  alias gbranch='git branch'
  alias gcheckout='git checkout'
  alias gclone='git clone'
  alias gcommit='git commit -m'
  alias gfetch='git fetch'
  alias gpull='git pull origin'
  alias gpush='git push origin'
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
  alias srvstatus='sudo service --status-all'
  alias srvrunning='srvstatus | grep -e " + "'
  alias srvstopped='srvstatus | grep -e " - "'
  # alias srvreload=''
  # alias srvstart=''
  # alias srvstop=''
  # alias srvrestart=''
fi

# Resources - Systemd
if [[ ! -f /etc/wsl.conf ]]; then
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
## Youtube Download
if [[ -f /usr/bin/youtube-dl ]]; then
  alias ytaudio-aac='youtube-dl --extract-audio --audio-format aac'
  alias ytaudio-best='youtube-dl --extract-audio --audio-format best'
  alias ytaudio-flac='youtube-dl --extract-audio --audio-format flac'
  alias ytaudio-m4a='youtube-dl --extract-audio --audio-format m4a'
  alias ytaudio-mp3='youtube-dl --extract-audio --audio-format mp3'
  alias ytaudio-opus='youtube-dl --extract-audio --audio-format opus'
  alias ytaudio-vorbis='youtube-dl --extract-audio --audio-format vorbis'
  alias ytaudio-wav='youtube-dl --extract-audio --audio-format wav'
  alias ytvideo-best='youtube-dl -f bestvideo+bestaudio'
fi
