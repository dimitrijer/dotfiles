export ZSH=/Users/dimitrijer/.oh-my-zsh

ZSH_THEME="crunch"
COMPLETION_WAITING_DOTS="true"

plugins=(osx tmux docker poetry taskwarrior timewarrior)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_ed25519"

alias ll="exa -alhb --git --color=auto"
alias ls="exa --color=auto"
alias weather="curl http://wttr.in/"
alias gg="git gui"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'
alias irssi="TERM=screen-256color irssi"
alias t="task"
alias tw="timew"
alias igrep="grep -i"
alias spot="spotify"

# Add sbin to path (brew installs some stuff there).
export PATH="/usr/local/sbin:$PATH"
# Stack installs stuff here.
export PATH="$HOME/.local/bin:$PATH"

# Use GNU utils instead of BSD
export PYTHON_LIB_PATH="/Users/dimitrijer/Library/Python/3.8"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export POWERLINE_PATH="$PYTHON_LIB_PATH/lib/python/site-packages/powerline"
export PATH="$PATH:$PYTHON_LIB_PATH/bin"
source $POWERLINE_PATH/bindings/zsh/powerline.zsh
export HOMEBREW_GITHUB_API_TOKEN="#######################"
fpath=(/usr/local/share/zsh-completions $fpath)

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export EDITOR='nvim'

export DISABLE_AUTO_TITLE='true'

fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

alias v='f -e nvim'
alias o='a -e open'
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias ssh='TERM=screen-256color ssh'

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export PATH="$PATH:/Users/dimitrijer/.poetry/bin"

gtfo() {
    pgrep "$1" | xargs kill -9
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# Poetry virtualenv fix
[ -z "${POETRY_ACTIVE}" ] || source "$(poetry debug:info | grep Path | awk '{print $3}')/bin/activate"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dimitrijer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dimitrijer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dimitrijer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dimitrijer/google-cloud-sdk/completion.zsh.inc'; fi

export ANDROID_NDK_HOME="/usr/local/share/android-sdk/ndk/18.1.5063045"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

eval "$(direnv hook zsh)"

export PATH="$PATH:$HOME/.deverel"
