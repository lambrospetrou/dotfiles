#!/bin/bash

# backup existing files
rm -rf ~/.vim.backup
mkdir -p ~/.vim.backup
mv ~/.vim ~/.vimrc ~/.viminfo ~/.vim.backup/

# Put the new .vimrc
cp _.vimrc ~/.vimrc

# Install the Plug plugins
vim -c "PlugInstall"
