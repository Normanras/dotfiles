# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# autoload -Uz compinit; compinit; _comp_options+=(globdots);

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
eval "$(pyenv virtualenv-init -)"

# Function to Correctly Source $VIRTUAL_ENV for Neovim
function nvimvenv {
 if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
   source "$VIRTUAL_ENV/bin/activate"
   command nvim "$@"
   deactivate
 else
   command nvim "$@"
 fi
}

alias nvim=nvimvenv
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
export PATH="/opt/homebrew/bin:$PATH"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
NPM_PACKAGES=/Users/normrasmussen/.npm-packages
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/Cellar/pyenv-virtualenv/1.2.1/shims:/Users/normrasmussen/.pyenv/shims:/Users/normrasmussen/.local/share/nvim/mason/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/Cellar/pyenv-virtualenv/1.2.1/shims:/Users/normrasmussen/.pyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/opt/homebrew/opt:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Applications/CyberArk\ EPM.app/Contents/Helpers:/usr/local/go/bin:/Users/normrasmussen/.rvm/bin:/Users/normrasmussen/.rvm/bin:$NPM_PACKAGES/bin
