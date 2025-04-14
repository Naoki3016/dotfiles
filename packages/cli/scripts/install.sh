#!/bin/sh
set -e

# Homebrew のインストール
if [ ! -f /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# dotfiles のクローン
if [ !  -d ~/dotfiles ]; then
    cd ~
    git clone git@github.com:Naoki3016/dotfiles.git
fi

# .DS_Store が存在する場合に削除
if find ~/dotfiles/packages/ -name ".DS_Store" | grep -q .; then
    find ~/dotfiles/packages/ -name ".DS_Store" -delete
    echo "Removed existing .DS_Store files."
fi

# Homebrew パッケージのインストール
brew bundle --file=~/dotfiles//Brewfile

# stowで繋げる
stow -v -d ~/dotfiles/packages -t ~ git keybindings terminal wm

# init.lua に設定を追加（既存のものを壊さないようにする）
if ! grep -q 'stackline' ~/.hammerspoon/init.lua; then
  echo 'stackline = require "stackline"' >> ~/.hammerspoon/init.lua
  echo 'stackline:init()' >> ~/.hammerspoon/init.lua
fi