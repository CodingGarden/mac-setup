# install xcode build tools

xcode-select --install

# install homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew formulae

# install homebrew casks

# setup bash_profile and other dot files

cd ~

curl -O https://raw.githubusercontent.com/w3cj/dotfiles/master/.bash_profile

curl -O https://github.com/w3cj/dotfiles/blob/master/.gitignore

# configure git

git config --global user.name w3cj

git config --global user.email cj@null.computer

git config --global core.editor nano

# install node version manager

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash

nvm install lts
nvm install latest

# global npm installs

nvm use latest
npm install -g lite-server gitignore license

# create dev folder

mkdir ~/dev

