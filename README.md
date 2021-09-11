# Dotfiles
All my dot files in one place ...

# Aliases
> ## APT
**update** : *sudo apt update*  
**upgrade** ** : *sudo apt upgrade  
**search** : *apt search  
**install** : *sudo apt install  
**uninstall** : *sudo apt --purge remove  
**clean** : *sudo apt --purge autoremove  

> ## Shell - Common
**cd..** : *cd ..  
**cls** : *clear*  
**cls.** : *clear && colorscript -e crunchbang-mini*  
**mkdir** : *mkdir -pv*  
**ls** : *ls -AGlhv --color=auto --group-directories-first*  
**dir** : *ls -AGlhv --color=auto --group-directories-first*  
**zombies** : *ps -A -ostat,pid,ppid | grep -e "[zZ]"*  
**rcolors** : *colorscript -r*  

> ## Shell - Exa
**ll** : *exa -al --tree --level=1*  
**la** : *exa -ahl --group-directories-first --sort=name*  
**l.** : *exa -a --group-directories-first --sort=name | egrep "^\."*  

> ## Shell - Grep.
**grep** : *grep --color=auto*  
**egrep** : *egrep --color=auto*  
**fgrep** : *fgrep --color=auto*  

> ## Git
**gitkey** : *export GPG_TTY=$(tty)*  
**gitview** : *git log --oneline --decorate --graph --all*  
**addup** : *git add -u*  
**addall** : *git add .*  
**branch** : *git branch*  
**checkout** : *git checkout*  
**clone** : *git clone*  
**commit** : *git commit -m*  
**fetch** : *git fetch*  
**pull** : *git pull origin*  
**push** : *git push origin*  
**gs** : *git status*  
**tag** : *git tag*  
**newtag** : *git tag -a*  

> ## Terraform
**trplan** : *terraform plan -out*  
**trapply** : *terraform apply*  
**trlist** : *terraform state list*  
**trshow** : *terraform state show*  

> ## Top process(es) eating memory
**psmem** : *ps auxf | sort -nr -k 4*  
**psmem10** : *ps auxf | sort -nr -k 4 | head -10*  
> ## Top process(es) eating cpu
**pscpu** : *ps auxf | sort -nr -k 3*  
**pscpu10** : *ps auxf | sort -nr -k 3 | head -10*  

> ## Network
**ping** : *sudo ping -a -c 10 -W 1*  

> ## Adding Flags / This one saved by butt so many times ...
**wget** : *wget -c*  
**cp** : *cp -i*  
**df** : *df -h*  

> ### Youtube Download
**yta-aac** : *youtube-dl --extract-audio --audio-format aac*  
**yta-best** : *youtube-dl --extract-audio --audio-format best*  
**yta-flac** : *youtube-dl --extract-audio --audio-format flac*  
**yta-m4a** : *youtube-dl --extract-audio --audio-format m4a*  
**yta-mp3** : *youtube-dl --extract-audio --audio-format mp3*  
**yta-opus** : *youtube-dl --extract-audio --audio-format opus*  
**yta-vorbis** : *youtube-dl --extract-audio --audio-format vorbis*  
**yta-wav** : *youtube-dl --extract-audio --audio-format wav*  
**ytv-best** : *youtube-dl -f bestvideo+bestaudio*  
