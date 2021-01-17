#!/bin/bash

# install basic tools
apt-get install sudo
sudo apt-get update -y
sudo apt-get install -y wget curl vim git tmux

# install utilities
sudo apt-get install -y silversearcher-ag tree ctags

# install dependencies for python-build ( for YCM build )
sudo apt-get install -y build-essential libreadline-dev zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev cmake python3-dev

# install node & npm
sudo apt-get install -y nodejs npm
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
cat >> ~/.bashrc << '_EOF_'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
_EOF_

sudo npm -g install js-beautify
sudo npm -g install html-beautify

# install go
snap install --classic go
cat >> ~/.bashrc << _EOF_
# add snap bin to path
export PATH="\$PATH:/snap/bin"
_EOF_

# install java
sudo apt install openjdk-8-jdk openjdk-8-jre
cat >> /etc/environment << _EOF_
# Add java path
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
_EOF_

# Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install extra lsp servers
git clone https://github.com/ycm-core/lsp-examples.git ~/.vim/lsp-examples

# vim setting
ln -s ~/custom_dotfiles/.vimrc ~/.vimrc
vim +PluginInstall +qall 

# YCM config
ln -s ~/custom_dotfiles/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

# tmux config
ln -s ~/custom_dotfiles/.tmux.conf ~/.tmux.conf

# git config
ln -s ~/custom_dotfiles/.gitconfig ~/.gitconfig

# editorconfig
ln -s ~/custom_dotfiles/.editorconfig ~/.vim/

# zsh
# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
# chsh -s $(which zsh)
# git clone https://github.com/zdharma/fast-syntax-highlighting ~/.zsh/zsh-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# build YCM
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --ts-completer --go-completer --java-completer
python3 ~/.vim/lsp-examples/install.py --enable-kotlin --enable-docker --enbale-bash --enable-yaml --enable-json --enable-vim
python3 -m pip -U install black, flake8

# install anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh | bash

# custom commands
cat >> ~/.bashrc <<- '_EOF_'
	export PATH="/home/sean/.local/bin:$PATH"
	
	pvim(){ PYTHONPATH=$PYTHONPATH:$PWD vim ;}
	pytest() { python -m pytest ;}
	gst(){ git status ;}
_EOF_
