# Preface
Here's how to install `zsh` and beautify it with `starship`.  
Note(s): This is for Debian based systems. It should be pretty easy to adapt for other distros.  

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
⚠ *Only do this if you know what you're doing or if you trust the source!*  

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
To configure your `starship` prompt, it's your `starship.toml` file.  
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
