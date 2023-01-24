---
title: Setup Instructions
authors: [maxwill]
tags: [setting, settings, system, 0]
lastUpdated: Jan 24, 2023
---

# Setup Instructions
- This file was last updated at Jan 24, 2023
- Log
    - Jan 24, 2023: WSL python setup 
- should update [git repo](https://github.com/EazyReal/Settings) instead of [hackmd version](https://hackmd.io/hRo_4S4jSGGDN7EsU_WYYw) mainly
- TODO:
    - seperate Mac, Linux more clearly
    - maintain installation scripts 

## Ubuntu
- chinese
- installation of packages

## Haskell
https://www.haskell.org/ghcup/

## ZSH
- https://github.com/EazyReal/Settings/blob/main/zsh/install.sh
- oh-my-zsh
    - plugins see github setting
    - theme avit
    - to install some custom plugins, use git clone 

## WSL
- how to set up user instead of using root?
- `apt-get install build-essential`

## Mac

### System
- [add home to finder](https://www.cnet.com/tech/computing/how-to-find-your-macs-home-folder-and-add-it-to-finder/)
- shorcuts

### Web Apps
- slack
- notion
- 104 pro
- uber
- sync calendar

### Desktop Apps
- chrome
    - https://www.google.com/chrome/
- chrone extensions
    - metamask, etc.
    - hackmd-it
    - google scholar
- VS code
    - https://code.visualstudio.com/docs/setup/mac
- slack, telegram, notion
- 老石
    - Alfred
    - Rectangle (need permission!)
- MacTex
- Zotero
    - https://www.youtube.com/watch?v=_Fjhad-Z61o
        - ZotFile + MdNotes + Obsidian
    - ZotFile
    - Notero
    - MdNotes
    - zotero-better-bibtex
    - zotero-folder-import
- Obsidian
    - citations
    - templater
    - obsidian git
    - vs code
    - linter
    - etc.
- OBS recorder
    - `brew instlall blackhole for recording native sounds`
- MathPic
- Pulse Secure

---

### MacOS Basic
- build essentials and brew 
```bash=
# build essentials
xcode-select --install

# home brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# add to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/maxwill/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)" 
# check install complete
brew -v
```

---

### C++
- gnu gcc for bits, pbds
    - `brew install gcc`
- https://github.com/khaveesh/macOS-stdc.h

---

### Git
- [example .gitconfig from mathiasbynens](https://github.com/mathiasbynens/dotfiles/blob/main/.gitconfig)
```toml
[init]
	defaultBranch = main

[alias]
	ac = !git add -A && git commit -avm
```
- ssh setup
- CLI tool `gh`
```
brew install gh
```

---

### Pandoc
- brew install pandoc
- MacTex
- add to PATH by `PATH="/Library/TeX/texbin:$PATH"`

---

### Node js
- install with web

---

### Python
- prerequisite for building from source
- pyenv
    - install python from here
- poetry
- jupyter lab
    - [change kernel to match virtual env](https://www.geeksforgeeks.org/using-jupyter-notebook-in-virtual-environment/)
    - pandoc + MacTex for conversion

#### Python for MacOS ZSH
- on Jan 24, 2023
```bash
brew update

# python build env
brew install openssl readline sqlite3 xz zlib

# pyenv
brew install pyenv
# pyenv PATH for zsh see https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# source and check install
. ~/.zprofile && . ~/.zshrc && pyenv -v

# continue to add your python versions!
# pyenv install -list # can see the versions available
# pyenv latest # can see the latest given a prefix
# pyenv install 3.10.2
# pyenv global # can see system 
# pyenv global 3.10.3

# poetry
curl -sSL https://install.python-poetry.org | python3 -
echo 'PATH="$HOME/.local/bin:$PATH"' >> ~/.zprofile
# source and check install
. ~/.zprofile && poetry -V
# poetry completions zsh > ~/.zfunc/_poetry
# https://github.com/python-poetry/poetry#enable-tab-completion-for-bash-fish-or-zsh

# jupyter lab, thus require user bin (~/.local/bin), which is added above
pip install --user jupyterlab
jupyter --version
```

#### Python for WSL Ubuntu ZSH
- https://www.techtronic.us/install-python-pyenv-on-wsl-ubuntu/
- on Jan 24, 2023

```bash
# Jan 24, 2023 by Yan-Tong Lin
# scripts for installing pyenv, peotry, and jupyter labs
######################################################################################################

# pyenv
# https://gist.github.com/josemarimanio/9e0c177c90dee97808bad163587e80f8
# https://www.techtronic.us/install-python-pyenv-on-wsl-ubuntu/


# Install dependencies
sudo apt-get install build-essential
sudo apt-get install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev
brew install pyenv

# Install Pyenv
curl https://pyenv.run | zsh 

# PATH for zsh see https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# source and check install
. ~/.zprofile && . ~/.zshrc && pyenv -v

# Usages
# continue to add your python versions!
# pyenv install -list # can see the versions available
# pyenv latest # can see the latest given a prefix
# pyenv install 3.10.2
# pyenv global # can see system 
# pyenv global 3.10.3


######################################################################################################

# poetry
curl -sSL https://install.python-poetry.org | python3 -
echo 'PATH="$HOME/.local/bin:$PATH"' >> ~/.zprofile
# source and check install
. ~/.zprofile && poetry -V
# poetry completions zsh > ~/.zfunc/_poetry
# https://github.com/python-poetry/poetry#enable-tab-completion-for-bash-fish-or-zsh

# jupyter lab, thus require user bin (~/.local/bin), which is added above
pip install --user jupyterlab
jupyter --version
```