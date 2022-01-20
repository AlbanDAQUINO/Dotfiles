# Preface

Here's how to install and beautify `zsh`.

This is for Debian based systems. It should be pretty easy to adapt for other distros.



## System Updates

Start by updating your system (if not already done).

```shell
sudo apt update && sudo apt upgrade
```



## ZSH installation

Then install `zsh` as well as `curl`, `software-properties-common` and `wget`.

```shell
sudo apt install --yes --no-install-recommends curl software-properties-common wget zsh
```



## 🚀 installation

To install `starship` you will need to run the installation script directly from the website using curl (no `sudo` or `doas` needed, the script will ask for it if/when needed).

```shell
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

⚠ *Only to this if you know what you're doing or if you trust the source!*



If you need help with the installation script:

```shell
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --help
```



### Links :

> Installation link : [Starship Installation](https://starship.rs/guide/#%F0%9F%9A%80-installation)

> Configuration link : [Starship Configuration](https://starship.rs/config/)





## Basic configuration

To get started with `starship` edit your `.zshrc` file to add the following:

```shell
# ~/.zshrc
eval "$(starship init zsh)"
```

Then `source` your `.zshrc` file for the changes to take effect.



### Configuration files

To activate `starship` in `zsh`, it's your `.zshrc` file.

> It's usually found at the root of your `home` directory.

To configure your `starship` prompt, it your `starship.toml` file.

> It's usually found in your `/.config/` directory.





## Advanced configuration

Here's how I configured it:

```shell
~/.zshenv -> .config/zsh/.zshenv

~/.config/zsh/
├── plugins/
│   ├── simple-completion.zsh
│   └── zsh-autosuggestion.zsh
├── .aliases
├── .zprofile
├── .zshenv
├── .zsh_history
└── .zshrc

~/.config/starship/
├── cache/
├── config.toml
├── manjaro.toml
└── powershell.toml


```



### ZSH

Create a `zsh` folder in your `~/.config/` directory and add a `plugins` directory to it.

Then copy/create your `.zshenv`, `.zprofile`, `.zshrc` and `aliases` files to `~/.config/zsh/`. Also, put your plugins in the `plugins` directory.

> Global Order: zshenv, zprofile, zshrc, zlogin



Edit your `.zshenv` file to add the following:

```shell
# Starship
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
export STARSHIP_CACHE=$HOME/.config/starship/cache
# Zsh
export ZDOTDIR=$HOME/.config/zsh

```

This will set the default `zsh` directory to `~/.config/zsh/`, set the defaut `starship` configuration file to `~/.config/starship/config.toml` and cache directory to `~/.config/starship/cache/`.



Create a symbolic link to the `.zshenv` file in your `home` directory.

```shell
ln -s ~/.config/zsh/.zshenv ~
```



Edit your `.zshrc` file to add the following:

```shell
# ~/.zshrc
eval "$(starship init zsh)"
```



### Starship

Create a `starship` folder in your `~/.config/` directory and add a `cache` directory to it.

Then copy/create your `config.toml` file to `~/.config/starship/`.



As an example, here the configuration I'm using:

```toml
#        d8888 888 888      
#       d88888 888 888      
#      d88P888 888 888      
#     d88P 888 888 88888b.  
#    d88P  888 888 888 "88b 
#   d88P   888 888 888  888 
#  d8888888888 888 888  888 
# d88P     888 888 888  888    v1.0.21
#
# ~/.config/starship/config.toml

# Inserts a blank line between shell prompts
add_newline = true

# Change the default prompt format
format = """\
[╭╴](238)$env_var$hostname$username$directory\
$all[╰─](238)$shell$status$character"""
# move the rest of the prompt to the right
right_format = """$cmd_duration$time $battery"""
command_timeout = 3_000

# Shows an icon based on the os or distribution
[env_var.STARSHIP_DISTRO]
# - Debian: 160 / Devuan: 093 / Manjaro: 042 / Ubuntu: 208 / Windows: 033
style = "160"
format = '[$env_value]($style) '
variable = "STARSHIP_DISTRO"
disabled = false

# Shows hostname
[hostname]
style = "bold 240"
ssh_only = false
trim_at = "."
format = "[$hostname]($style) "
disabled = false

# Shows the username
[username]
style_user = "bold white"
style_root = "bold red"
format = "[$user]($style) "
show_always = true
disabled = false

# Shows the current directory
[directory]
truncation_length = 20
truncate_to_repo = true
truncation_symbol = " …/"
home_symbol = " ~"
read_only_style = "bold 160"
read_only = " "
format = "[$read_only]($read_only_style)[$path](039) "
disabled = false

# Shows the SHELL indicator
[shell]
style = "dimmed white"
# Alternate:  
zsh_indicator = "[](white) ZSH"
bash_indicator = "[](white) BASH"
powershell_indicator = "[](white) PS"
unknown_indicator = "[?](white) SHELL"
disabled = false

# Status
[status]
# Alternatives = "✗"
symbol = " "
success_symbol = "✔️"
not_executable_symbol = "🚫"
not_found_symbol ="🔍"
sigint_symbol = "🧱"
signal_symbol = "⚡"
style = "bold 160"
format = "[$symbol$status]($style) "
recognize_signal_code = true
disabled = false

# Change the default prompt indicator
[character]
# Windows Poweshell: 
# success_symbol = "[](bold 033)[_](bold white)"
# Linux:
success_symbol = "[](bold 034)[_](bold white)"
error_symbol = "[](bold 160)[_](bold white)"

# Shows Command dureation if > 10s
[cmd_duration]
# Show command execution time over 5 secs (in ms)
min_time = 5_000
format = "Took [$duration]($style)"
disabled = false

# Shows the time
[time]
format = '🕙 [\[$time\]]($style)'
time_format = "%T"
utc_time_offset = "1"
disabled = false

# Shows the battery status 
[battery]
full_symbol = "🔋 "
charging_symbol = "🔌 "
discharging_symbol = " ⚡ "
disabled = false
# "bold red" style when capacity is between 0% and 20%
[[battery.display]]
threshold = 20
style = "bold red"
# "bold orange" style when capacity is between 20% and 40%
[[battery.display]]
threshold = 40
style = "bold orange"
# "bold yellow" style when capacity is between 60% and 100%
[[battery.display]]
threshold = 60
style = "bold yellow"
# "bold green" style when capacity is at 100%
[[battery.display]]
threshold = 100
style = "bold 034"

[memory_usage]
symbol = ""
disabled = true

# Shows the Git branch
[git_branch]
# Alternatives = " "
symbol = " "
format = "on [$symbol](034) [$branch](bold 076) "
truncation_length = 15
truncation_symbol = "…/"
style = "bold 034"
disabled = false

# Show the Git status
[git_status]
style = "034"
# Repository
up_to_date = "[](082)"
conflicted = "[](082)"
behind = "[⇣${count}](082)"
ahead = "[⇡${count}](082)"
# Branch
untracked = " ${count}"
modified = " ${count}"
stashed = " 﫻${count}"
# Alternatives = "   笠   "
renamed = " ${count}"
deleted = " ${count}"
staged = " ${count}"
# Final Prompt
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
format = '[\($ahead_behind$all_status\)]($style) '
disabled = false

# Force Python symbol and version
[python]
# Alternatives = ""
symbol = ""
# format = "$symbol"
python_binary = "python3"
disabled = false

# Shows Terraform version
[terraform]
# Alternatives = "  "
format = "using [ terraform $version]($style) "
disabled = false

# Shows Vagrant version
[vagrant]
format = "using [﵂ vagrant $version]($style) "
disabled = false

# Shows Docker context
[docker_context]
format = "using [ $context](bold blue) "
# detect_files = ["docker-compose.yml", "docker-compose.yaml", "Dockerfile"]
# only_with_files = true
disabled = false

# Shows Ansible version
# "ﴂ"

# Shows Helm version
[helm]
format = "using [ $version](bold purple) "
disabled = false

# Shows Node.js version
[nodejs]
format = "using [ $version](bold green) "
disabled = true

# Shows Ruby version
[ruby]
format = "using [ $version]($style) "
disabled = false

# Shows AWS context
[aws]
symbol = ""
style = "yellow"
format = '[$symbol $profile \($region\)]($style) '
disabled=true
# Add AWS zone aliases
[aws.region_aliases]
eu-west-3 = "EU, Paris"
us-west-1 = "US, Virginia"

[kubernetes]
format = 'on [☸ $context \($namespace\)](dimmed green) '
disabled = true
[kubernetes.context_aliases]
"dev.local.cluster.k8s" = "dev"

```
