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

# install js-beautify
sudo npm -g install js-beautify
cp ~/custom_dotfiles/.editorconfig ~/.vim/

python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --ts-completer

# git
cp ~/custom_dotfiles/.gitconfig ~/.gitconfig

# zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
chsh -s $(which zsh)

# pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

cat >> ~/.zshrc << 'EOL'
# pyenv configuration.              
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"              
eval "$(pyenv virtualenv-init -)"                                       

# For compilers to find zlib you may need to set:                            
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"                        
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"                                                                                               

# For pkg-config to find zlib you may need to set:                           
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"                                                                             
export PYENV_VIRTUALENV_DISABLE_PROMPT=1                                     
EOL                                 

# install dependencies for python-build
sudo apt-get install build-essential libreadline-dev zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev

# install python
LDFLAGS=
pyenv install 3.6.5
