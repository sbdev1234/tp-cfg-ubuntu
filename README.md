# tp-cfg-ubuntu
Template repo. Boilerplate configuration for new Ubuntu (Debian) distros & dev containers. Use this template repo (see GitHub) as a start-point for your own Ubuntu configuration. I use this template for my cfg-ubuntu repo.

## About

`./install.sh` will:

- install oh-my-bash if missing. 
- set `OSH_CUSTOM="$HOME/.config/omb"`
- install oh-my-zsh if missing. 
- set `ZSH_CUSTOM=$HOME/.config/omz`
- install my multi-line `focus` prompt theme for `oh-my-bash/zsh` 
- set `oh-my-bash/zsh` to use the `focus` theme
- copy `./home/` to `$HOME`.    
  WARNING: Existing files are replaced!  
  

### FYI:
- `./home/` contains configuration dotfiles
- I use this repo for VSCode dev container [personalization](https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories)

## Manual Install

- Clone repo to your Ubuntu distro
- `cd` to the cloned repo's folder
- Run `./install.sh`

## Assumptions

- `curl` and `rsync` are installed.

----

_All copyrights acknowledged_.
