#! /bin/bash

set -e

cd "$(dirname "$0")"

mkdir -p "$HOME/.local/bin"

cp -rp config/* "$HOME/.config/"
mv "$HOME/.config/p10k.zsh" "$HOME/.p10k.zsh"

curl -SOL https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-aarch64-unknown-linux-gnu.tar.gz &&
  tar zxf bat-v0.24.0-aarch64-unknown-linux-gnu.tar.gz &&
  install bat-v0.24.0-aarch64-unknown-linux-gnu/bat "$HOME/.local/bin/" &&
  rm -rf bat-v0.24.0-aarch64-unknown-linux-gnu* bat

ZSH_SUGGESTIONS_REPO=https://github.com/zsh-users/zsh-autosuggestions
ZSH_HIGHLIGHTING_REPO=https://github.com/zsh-users/zsh-syntax-highlighting.git
POWERLEVEL10K_REPO=https://github.com/romkatv/powerlevel10k.git
TG_PLUGIN_REPO=https://github.com/jkavan/terragrunt-oh-my-zsh-plugin

git clone $ZSH_SUGGESTIONS_REPO "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone $ZSH_HIGHLIGHTING_REPO "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
git clone $TG_PLUGIN_REPO "$HOME/.oh-my-zsh/custom/plugins/terragrunt"
git clone --depth=1 $POWERLEVEL10K_REPO "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

cat zshrc >>"$HOME/.zshrc"

sudo chsh -s "$(which zsh)" "$(whoami)"
