export PATH=$HOME/.local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

alias cat='bat --paging=never'

source ~/powerlevel10k/powerlevel10k.zsh-theme

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  docker
  docker-compose
  kubectl
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /google-cloud-sdk/*.zsh.inc
