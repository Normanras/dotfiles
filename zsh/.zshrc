
# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(
    zsh-autosuggestions,
    git,
    wakatime,
    brew,
    npm,
    z,
    zsh-syntax-highlighting,
    vi-mode,
)

# Zsh Autosuggestion Config
source ~/.dotfiles/zsh/zsh-autosuggestions/
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# User configuration

export DOT="~/.dotfiles"
alias vim='vim -S ~/.vimrc'
alias nvim='nvim'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

export EDITOR="$VISUAL"
export VISUAL='nvim'
export PYTHONPATH="/opt/homebrew/bin/python3:$PYTHONPATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# alias nvim-minimal="NVIM_APPNAME=Minivim nvim"
# alias nvim-arduino="NVIM_APPNAME=Arduino nvim"

#function nvims() {
#  items=("Main" "Minivim" "Arduinvim")
#  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#  if [[ -z $config ]]; then
#    echo "Nothing selected"
#    return 0
#  elif [[ $config == "Main" ]]; then
#    config=""
#  fi
#  NVIM_APPNAME=$config nvim $@
#}
#bindkey -s ^a "nvims\n"

# source /Users/normrasmussen/.docker/init-zsh.sh || true # Added by Docker Desktop

export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/sbin:$PATH"
eval "$(starship init zsh)"
export PATH="/opt/homebrew/bin:$PATH"
