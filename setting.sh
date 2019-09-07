apt-get install sudo
sudo apt-get update -y
sudo apt-get install wget curl vim 

sudo apt-get install zsh git -y
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
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

# git setting
git config --global user.email "sunjun1225@gmail.com"
git config --global user.name "Sean Park"

# zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
chsh -s $(which zsh)

