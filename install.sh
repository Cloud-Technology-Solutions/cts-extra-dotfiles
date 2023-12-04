#! /bin/bash

set -e

cd "$(dirname "$0")"

mkdir -p "$HOME/.local/bin"

cp -rp config/* "$HOME/.config/"

curl -SOL https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-aarch64-unknown-linux-gnu.tar.gz &&
  tar zxf bat-v0.24.0-aarch64-unknown-linux-gnu.tar.gz &&
  install bat-v0.24.0-aarch64-unknown-linux-gnu/bat "$HOME/.local/bin/" &&
  rm -rf bat-v0.24.0-aarch64-unknown-linux-gnu* bat

ZSH_SUGGESTIONS_REPO=https://github.com/zsh-users/zsh-autosuggestions
ZSH_HIGHLIGHTING_REPO=https://github.com/zsh-users/zsh-syntax-highlighting.git

sudo apt-get update
sudo apt-get install --assume-yes --no-install-recommends zsh

git clone $ZSH_SUGGESTIONS_REPO "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone $ZSH_HIGHLIGHTING_REPO "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g" "$HOME/.zshrc"

cat zshrc >>"$HOME/.zshrc"

chsh /usr/bin/zsh
