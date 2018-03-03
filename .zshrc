export ZSH=/Users/dimitrijer/.oh-my-zsh

ZSH_THEME="crunch"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(maven brew terminalapp history history-substring-search lein)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LESSCHARSET=UTF-8
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/id_ed25519"
export JAVA_HOME=$(/usr/libexec/java_home)

# Use GNU utils instead of BSD
export PATH="/Users/dimitrijer/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gettext/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

alias ll="exa -alhb --git --color=auto"
alias ls="exa --color=auto"
alias weather="curl http://wttr.in/"
alias gg="git gui"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'
alias irssi="TERM=screen-256color irssi"
alias igrep='grep -i'

export HOMEBREW_GITHUB_API_TOKEN="##########"
fpath=(/usr/local/share/zsh-completions $fpath)

[ -n "$TMUX" ] && export TERM=screen-256color
alias tmux="TERM=xterm-256color tmux"
alias ssh="TERM=xterm-256color ssh"

export PYTHON_USER_LIB="/Users/dimitrijer/Library/Python/3.6"
export PATH="$PYTHON_USER_LIB/bin:$PATH"
powerline-daemon -q

export PYTHON_PKG_PATH="$PYTHON_USER_LIB/lib/python/site-packages"
source "$PYTHON_PKG_PATH/powerline/bindings/zsh/powerline.zsh"

export ECLIPSE_HOME="/Applications/Eclipse.app/Contents/Eclipse/"
export DEVEREL_HOME="/Users/dimitrijer/bin/deverel"
export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="/usr/local/opt/protobuf@2.5/bin:$PATH"
export PATH="/Users/dimitrijer/bin/deverel:$PATH"

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
