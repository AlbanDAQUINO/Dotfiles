#! /bin/sh
# Custom Aliases
#
unalias -a

# APT
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias search='apt search'
alias install='sudo apt install'
alias remove='sudo apt --purge remove'
alias clean='sudo apt --purge autoremove'

# Shell - Common
alias banner='clear && run-parts /etc/update-motd.d'
alias '..'='cd ..'
alias '...'='cd ../..'
alias cd..='cd ..'
alias cls='clear'
alias mkdir='mkdir -pv'
alias ls='ls -AGlhv --color=auto'
alias ll='/usr/bin/ls -AGlhv --color=auto'
alias dir='/usr/bin/ls -AGlhv --color=auto --group-directories-first'
alias gpgtty='export GPG_TTY=$(tty)'

# Adding Some color in your life
if [[ -f /usr/bin/colorscript ]]; then
  alias cls='clear && colorscript -e crunchbang-mini'
  alias rcolors='colorscript -r'
fi
if [[ -f /usr/bin/screenfetch ]]; then
  alias sf='screenfetch'
fi
if [[ -f /usr/bin/highlight ]]; then
  alias cat='highlight -O ansi --force'
fi

## Shell - Exa
if [[ -f /usr/bin/exa ]]; then
  alias ll='exa -al --tree --level=1'
  alias lli='exa -al --tree --level=1 --icons'
  alias la='exa -ahl --group-directories-first --sort=name'
  alias l.='exa -a --group-directories-first --sort=name | egrep "^\."'
fi

## Shell - Grep.
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## Shell - Yadm
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

# Resources
alias ps='ps -afux'
alias zombies='/bin/ps -A -ostat,pid,ppid | grep -e "[zZ]"'
## Top process(es) eating memory
alias psmem='ps -afux | sort -nr -k 4'
alias psmem10='ps -afux | sort -nr -k 4 | head -10'
## Top process(es) eating cpu
alias pscpu='ps -afux | sort -nr -k 3'
alias pscpu10='ps -afux | sort -nr -k 3 | head -10'

# Network
alias ping='echo "--- Pinging 3 times ---" && sudo ping -a -c 3'
alias ssht='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias openport='sudo ss -tupln'

## Adding Flags / Those will save your butt !
alias wget='wget -c'
alias cp='cp -i'
alias df='df -h'

### Youtube Download
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

