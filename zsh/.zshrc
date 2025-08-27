
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# autoload -Uz compinit
# compinit
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# autoload -Uz compinit; compinit; _comp_options+=(globdots);

# User configuration
export DOT="~/.dotfiles"
alias vim='vim -S ~/.vimrc'
alias nvim='nvim'
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

export EDITOR="$VISUAL"
export VISUAL='nvim'
export PYTHONPATH="/opt/homebrew/bin/python3:$PYTHONPATH"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

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

export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
NPM_PACKAGES=/Users/$USERNAME/.npm-packages
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. "$HOME/.cargo/env"
export PATH="/usr/local/opt/openssl/bin:$PATH"
. "$HOME/.local/bin/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(uv generate-shell-completion zsh)"

# export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh
