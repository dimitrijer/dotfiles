export ZSH=/Users/dimitrijer/.oh-my-zsh

ZSH_THEME="crunch"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(brew terminalapp history history-substring-search docker)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export SSH_KEY_PATH="~/.ssh/id_ed25519"

alias ll="exa -alhbg --git --color=auto"
alias ls="exa --color=auto"
alias weather="curl http://wttr.in/"
alias gg="git gui"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'
alias irssi="TERM=screen-256color irssi"

# Use GNU utils instead of BSD
export PATH="/Users/dimitrijer/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/python/libexec/bin:/usr/local/opt/curl/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
export HOMEBREW_GITHUB_API_TOKEN="###################################"
fpath=(/usr/local/share/zsh-completions $fpath)

export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR='vim'
export DEVEREL_HOME="/Users/dimitrijer/bin/deverel"
export PATH="$DEVEREL_HOME:$PATH"
export ANSIBLE_LIBRARY=/Users/dimitrijer/git/ansible/nordeus_modules

# Irssi certificate isuses
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

. /usr/local/etc/profile.d/z.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
