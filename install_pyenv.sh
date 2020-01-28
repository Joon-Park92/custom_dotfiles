#!/bin/bash
if [ -d $HOME/.pyenv ]; then
  ¦ echo "pyenv already installed, exiting."
  ¦ exit 1
fi

echo "Installing pyenv..."
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo "Modifying ~/.bash_profile ..."
cat >> ~/.bash_profile << 'EOL'
# pyenv configuration.
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

EOL
echo "Done!"
