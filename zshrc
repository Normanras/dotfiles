# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
setopt promptsubst
autoload -U promptinit
promptinit
prompt grb

autoload -U compinit
compinit

# Add paths that should have been there by default
export PATH=$HOME/bin:/usr/local/git/current/bin:/usr/local/sbin:/opt/local/bin:/usr/local/bin:${PATH}
export FCEDIT=`which vim`
set -o vi
# Appends every command to the history file once it is executed
setopt inc_append_history
 # Reloads the history whenever you use it
setopt share_history

alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
alias sweep="find . -name .DS_Store -type f -delete ; find . -type d | xargs dot_clean -m"
#p4
# . $HOME/.bagpipe/setup.sh $HOME/.bagpipe ilteriscloudtop.c.googlers.com "corp-ssh-helper -relay=sup-ssh-relay.corp.google.com --stderrthreshold=INFO %h %p"

# export USER_CONFIG=$HOME/.zprofile
# echo >> $USER_CONFIG
# echo . $HOME/.bagpipe/setup.sh $HOME/.bagpipe ilteriscloudtop.c.googlers.com  >> $USER_CONFIG
# export PATH=$HOME/bin:$PATH >> $USER_CONFIG
# source $USER_CONFIG
# echo $BAGPIPE_DIR


# Unbreak history
export HISTSIZE=1000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Unbreak Python's error-prone .pyc file generation
export PYTHONDONTWRITEBYTECODE=1

export WORDCHARS='*?[]~&;!$%^<>'

export ACK_COLOR_MATCH='red'

# # ACTUAL CUSTOMIZATION OH NOES!
# gd() { git diff $* | view -; }
# gdc() { gd --cached $*; }
# alias pygrep="grep --include='*.py' $*"
# alias rbgrep="grep --include='*.rb' $*"
# alias r=rails
# alias t="script/tests $*"
# alias sr="screen -r"
# alias :q="echo YOU FAIL"

# activate_virtualenv() {
#     if [ -f env/bin/activate ]; then . env/bin/activate;
#     elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
#     elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
#     elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
#     fi
# }

# python_module_dir () {
#     echo "$(python -c "import os.path as _, ${1}; \
#         print _.dirname(_.realpath(${1}.__file__[:-1]))"
#         )"
# }

# Originally from Jonathan Penn, with modifications by Gary Bernhardt
function whodoneit() {
    (set -e &&
        for x in $(git grep -I --name-only $1); do
            git blame -f -- $x | grep $1;
        done
    )
}
export SHELL='/bin/zsh'

export EDITOR=/usr/bin/vim

export PATH=$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH

bindkey '^R' history-incremental-search-backward

 # enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
# Base16 Shell
BASE16_SCHEME="3024"
 BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
 [[ -s $BASE16_SHELL  ]] && . $BASE16_SHELL






# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# source /Library/GoogleCorpSupport/srcfs/shell_completion/enable_completion.sh
# export REMOTE_TSSERVER_HOSTNAME=ilteriscloudtop.c.googlers.com
export ANDROID_HOME=/Users/ikaplan/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=/Library/TeX/texbin:$PATH
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_192, x86_64`

# # Use vi mode
# bindkey -v
# autoload up-line-or-beginning-search
# autoload down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# # Vi mode settings
# # Better searching in command mode
# bindkey -M vicmd '?' history-incremental-search-backward
# bindkey -M vicmd '/' history-incremental-search-forward

# # Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

# Easier, more vim-like editor opening
# `v` is already mapped to visual mode, so we need to use a different key to
# open Vim
# bindkey -M vicmd "^V" edit-command-line
# bindkey -M viins "jk" vi-cmd-mode
# # Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
# export KEYTIMEOUT=10

# # perform parameter expansion/command substitution in prompt
# setopt PROMPT_SUBST

# vim_ins_mode="[I]"
# vim_cmd_mode="[C]"
# vim_mode=$vim_ins_mode


# function zle-keymap-select {
#   vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
#   zle reset-prompt
# }
# zle -N zle-keymap-select

# function zle-line-finish {
#   vim_mode=$vim_ins_mode
# }
# zle -N zle-line-finish

# RPROMPT='${vim_mode}'
# alias c='clear'
export PATH="$HOME/Code/flutter/bin:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"
eval 'set +o history' 2>/dev/null || setopt HIST_IGNORE_SPACE 2>/dev/null
 touch ~/.gitcookies
 chmod 0600 ~/.gitcookies

 git config --global http.cookiefile ~/.gitcookies

 tr , \\t <<\__END__ >>~/.gitcookies
.googlesource.com,TRUE,/,TRUE,2147483647,o,git-ikaplan.google.com=1//01f6v021B6g6SCgYIARAAGAESNwF-L9IrkuZz4KLcPtmlEcp-5ojfDWP3MmMj34HSlv_geL5n6JN6jm8cl-9OYxLgTZnNUeXvSb4
__END__
eval 'set -o history' 2>/dev/null || unsetopt HIST_IGNORE_SPACE 2>/dev/null

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc" export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/ruby/include"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ikaplan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ikaplan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ikaplan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ikaplan/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH (Rich Enchanced Shell History)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
