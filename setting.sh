#!/bin/bash

# install basic tools
apt-get install sudo
sudo apt-get update -y
sudo apt-get install -y wget curl vim git tmux

# install utilities
sudo apt-get install -y silversearcher-ag tree

# install dependencies for python-build ( for YCM build )
sudo apt-get install -y build-essential libreadline-dev zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev cmake python3-dev

# clone sean's dev enviroment
git clone https://github.com/Joon-Park92/custom_dotfiles.git ~/custom_dotfiles

# Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install extra lsp servers
git clone https://github.com/ycm-core/lsp-examples.git ~/.vim/lsp-examples

# vim setting
cp ~/custom_dotfiles/.vimrc ~/.vimrc
touch ~/.vimrc
vim +PluginInstall +qall 

# YCM config
cp ~/custom_dotfiles/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

# tmux config
cp ~/custom_dotfiles/.tmux.conf ~/.tmux.conf

# git config
cp ~/custom_dotfiles/.gitconfig ~/.gitconfig

# editorconfig
cp ~/custom_dotfiles/.editorconfig ~/.vim/

# zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
chsh -s $(which zsh)
# git clone https://github.com/zdharma/fast-syntax-highlighting ~/.zsh/zsh-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# flake-8 dir remapping
ln -s ~/.vim/bundle/vim-flake8/ftplugin ~/.vim/bundle/vim-flake8/plugin

# install node & npm
sudo apt-get install -y nodejs npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm -g install js-beautify

# install go
snap install --classic go
cat >> ~/.zshrc <<EOL
# add snap bin to path
export PATH="\$PATH:/snap/bin"
EOL

# install java
sudo apt install openjdk-8-jdk openjdk-8-jre
# cat >> /etc/environment <<EOL
# JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
# EOL

# build YCM
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --ts-completer --go-completer --java-completer
python3 ~/.vim/lsp-examples/install.py --enable-kotlin --enable-docker --enbale-bash --enable-yaml --enable-json --enable-vim

# install pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

cat >> ~/.zshrc <<EOL
# pyenv configuration.              
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "$(pyenv init -)"              
eval "$(pyenv virtualenv-init -)"                                       
EOL

source ~/.zshrc
