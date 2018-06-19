export ZSH=/Users/dimitrijer/.oh-my-zsh

ZSH_THEME="crunch"

plugins=(osx tmux docker)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export SSH_KEY_PATH="~/.ssh/id_ed25519"

alias ll="exa -alhb --git --color=auto"
alias ls="exa --color=auto"
alias weather="curl http://wttr.in/"
alias gg="git gui"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'
alias irssi="TERM=screen-256color irssi"
alias t="task"
alias igrep="grep -i"
alias spot="spotify"

export HOMEBREW_GITHUB_API_TOKEN="##########"
# Use GNU utils instead of BSD
export PYTHON_LIB_PATH="/Users/dimitrijer/Library/Python/3.6"
export PATH="$PYTHON_LIB_PATH/bin:/Users/dimitrijer/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/python/libexec/bin:/usr/local/opt/curl/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export POWERLINE_PATH="$PYTHON_LIB_PATH/lib/python/site-packages/powerline"
source $POWERLINE_PATH/bindings/zsh/powerline.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR='vim'

export DISABLE_AUTO_TITLE='true'

fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

alias v='f -e vim'
alias o='a -e open'

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

powerline-daemon -q

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
