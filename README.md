# ZSH / Starship Prompt Installation

Created: January 20, 2022 2:44 PM  
Last Edited Time: January 20, 2022 7:17 PM  
Req. Escalation: Yes  
Status: In Progress 🙌  
Tags: Beautifying, Linux, PowerShell, Shell, Starship 🚀, WSL, ZSH  
Type: Technical Guide  

# Preface

Here’s how to install and beautify `zsh`.

This is for Debian based systems. Pretty straightforward to adapt for other distros (or Powershell, example included).

You will need a Nerd font in order to be able to get the full benefits (includes icons).

> *Link: [https://www.nerdfonts.com/](https://www.nerdfonts.com/)*
> 

# System Updates

Start by updating your system (if not already done).

```
sudo apt update && sudo apt upgrade
```

# ZSH installation

Then install `zsh` as well as `curl`, `software-properties-common` and `wget` (for Debian based systems).

```bash
sudo apt install --yes --no-install-recommends curl software-properties-common wget zsh
```

# Starship 🚀 installation

To install `starship` you will need to run the script directly downloaded from the website using curl.
(no `sudo` or `doas` needed, the script will ask for priviledge escalation if/when needed).

```bash
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

⚠ *Only do this if you know what you’re doing or if you trust the source!*

If you need help with the installation script:

```bash
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --help
```

> Windows
> 

```powershell
choco install starship
```

## Links

[Starship: Installation](https://starship.rs/guide/#%F0%9F%9A%80-installation)

[Starship: Configuration](https://starship.rs/config/)

## Basic configuration

To get started with `starship` edit your `.zshrc` file to add the following:

```bash
# ~/.zshrc
eval "$(starship init zsh)"
```

Then `source` your `.zshrc` file for the changes to take effect.

> Windows
> 

Add those lines to your `$PROFILE`:

```powershell
# $PROFILE
# Starship
# - Aternatives: ""
$ENV:STARSHIP_DISTRO=""
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
Invoke-Expression (&starship init powershell)

```

## Configuration files

There is basically 2 files that you will need to edit.

To activate `starship` in `zsh`, it’s your `.zshrc` file.

> *It’s usually found at the root of your `home` directory.*
> 

To configure your `starship` prompt, it your `starship.toml` file.

> *It’s usually found in your `~/.config/` directory.*
> 

# Advanced configuration

Here’s how I configured it:

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

***TL:DR;** I moved all the config files, in their respective directories, into the directory `~/.config/`.*

## ZSH

Create a `zsh` folder in your `~/.config/` directory and add a `plugins` directory to it.

```bash
mkdir -p ~/.config/zsh/plugins
```

Then copy/create your `.zshenv`, `.zprofile`, `.zshrc` and `aliases` files to `~/.config/zsh/`. Also, put your plugins in the `plugins` directory.

Edit your `.zshenv` file to add the following:

```bash
# ~/.config/zsh/.zshenv

# Starship
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
export STARSHIP_CACHE=$HOME/.config/starship/cache
# Zsh
export ZDOTDIR=$HOME/.config/zsh

```

This will set the default `zsh` directory to `~/.config/zsh/`, set the defaut `starship` configuration file to `~/.config/starship/config.toml` and cache directory to `~/.config/starship/cache/`.

> *Global Order: zshenv, zprofile, zshrc, zlogin*
> 

> Windows
> 

Add those lines to your `$PROFILE`:

```powershell
# $PROFILE
# Starship
# - Aternatives: ""
$ENV:STARSHIP_DISTRO=""
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\config.toml"
$ENV:STARSHIP_CACHE = "$HOME\.config\starship\cache"
Invoke-Expression (&starship init powershell)

```

Create a symbolic link to the `.zshenv` file in your `home` directory.

```bash
ln -s ~/.config/zsh/.zshenv ~

```

Edit your `.zshrc` file to add the following:

```bash
# ~/.zshrc
eval "$(starship init zsh)"

```

## Starship

Create a `starship` folder in your `~/.config/` directory and add a `cache` directory to it.

```bash
mkdir -p ~/.config/starship/cache
```

Then copy/create your `config.toml` file to `~/.config/starship/`.

