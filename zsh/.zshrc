
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(
    zsh-autosuggestions
    git
    wakatime
)

# User configuration

export DOT="~/.dotfiles"
alias vim='vim -S ~/.vimrc'
alias nvim='nvim'
alias cd2='cd .. && cd ..'
alias tt="docker exec -ti timetagger_timetagger_1 timetagger"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

export EDITOR="$VISUAL"
export VISUAL='nvim'
export PYTHONPATH="/opt/homebrew/bin/python3:$PYTHONPATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

test -e /Users/normrasmussen/.iterm2_shell_integration.zsh && source /Users/normrasmussen/.iterm2_shell_integration.zsh || true

source /Users/normrasmussen/.docker/init-zsh.sh || true # Added by Docker Desktop

export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/sbin:$PATH"
eval "$(starship init zsh)"
export PATH="/opt/homebrew/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/normrasmussen/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
