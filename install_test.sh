#! /bin/bash

OSTYPE=$(uname)
echo $OSTYPE

if [[ "$OSTYPE" == "Linux-GNU"* ]]; then
       echo "Congrats! You're on the best operating system around."
       linux_install
elif [[ "$OSTYPE" == "Darwin"* ]]; then
        echo "Oo la la... Look at you on a Mac. Must be nice."
        mac_install
else
        echo "This is else"
fi
       echo "FI FI"

apt_installs = [wget, stow, lua, build-essential, libreadline-dev,
                clang-12 --install-suggests, tmux,  ]

       function linux_install() {
         apt-get update && apt-get upgrade -y
         apt install $(apt_installs)
         wget https://bootstrap.pypa.io/get-pip.py
         python3 ./get-pip.py

       }

       function mac_install() {
        brew_list = [pyenv, tmux, wget, tree-sitter, stow, ruby, lua, fzf, neovim, z, vim-zsh]
        brew install $(brew_list)
       }

# installing rust: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh (then select 1)
#
# apt items:
# - apt update && apt upgrade -y
#  - git,
#
# nvim items to install
# -  markdownlint, ruff, black, pycodestyle.
#
# brew to install:
# pyenv, tmux, wget, tree-sitter, stow, ruby, lua, fzf, neovim, z, vim-zsh,
#
# pip - tmuxp codespell, wheel, setuptools
