apt-get install sudo
sudo apt-get update -y
sudo apt-get install wget curl vim 

# install silver-searcher / zsh / git / tmux
sudo apt-get install silversearcher-ag zsh git tmux tree -y

git clone https://github.com/Joon-Park92/custom_dotfiles.git ~/custom_dotfiles

# Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# YCM
sudo apt-get install build-essential cmake python3-dev -y
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle

# vim setting
cp ~/custom_dotfiles/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
cp ~/custom_dotfiles/.vimrc ~/.vimrc
touch ~/.vimrc
vim +PluginInstall +qall 

# tmux config
cp ~/custom_dotfiles/.tmux.conf ~/.tmux.conf

# flake-8 dir remapping
ln -s ~/.vim/bundle/vim-flake8/ftplugin ~/.vim/bundle/vim-flake8/plugin

# ycm for javascript / nodejs to node remapping
sudo apt-get install nodejs npm
sudo ln -s /usr/bin/nodejs /usr/bin/node

python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --ts-completer

# git setting
git config --global user.email "sunjun1225@gmail.com"
git config --global user.name "Sean Park"

# zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
chsh -s $(which zsh)
