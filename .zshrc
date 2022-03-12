# Dependencies:
# - nix
# - nixpkgs.zsh-syntax-highlighting
# - nixpkgs.fd
# - nixpkgs.fzf
# - nixpkgs.fasd
# - nixpkgs.powerline
# - nixpkgs.pythonPackages.pygments
# - nixfiles.powerline-gitstatus

# Use UTF-8.
export LANG=en_US.UTF-8

# Point Nix derivations to use system locale archive.
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . /$HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Add common bin directories to PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/sbin:$PATH"

# Alt-f and Alt-b should use Bash-style word boundaries.
autoload -U select-word-style
select-word-style bash

# Use Emacs key bindings.
bindkey -e

# Share history between sessions.
setopt share_history

# Don't print dir stack when using pushd.
setopt pushdsilent

# Write to history file immediately, rather than after shell exits.
setopt inc_append_history histignorealldups

# Keep plenty of history around.
HISTFILE=$HOME/.zsh_history
HISTSIZE=20000
SAVEHIST=HISTSIZE

# Use modern completion system.
FPATH=$HOME/.nix-profile/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# Autostart ssh-agent on login, if not started already.
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
export SSH_KEY_PATH="~/.ssh/id_ed25519"

# Aliases.
alias ls='ls --color=auto -G'
alias ll='ls --color=auto -lh -G'
alias v='f -e nvim'
alias less='less -MmgiJ --line-numbers --underline-special'
alias igrep='grep -i'
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias blaze='bazel'
# Do not clear scrollback with clear.
alias clear='clear -x'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  alias vi='nvim'
  alias vim='nvim'
  export EDITOR='nvim'
fi

# Fasd setup.
fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Fish-like syntax higlighting.
. $HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fzf setup & configuration.
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
# Use fd instead of find.
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=" \
  --inline-info \
  --color=fg+:#F8F8F8,bg+:#515559,pointer:#F8F8F8,marker:226 \
  --bind=ctrl-e:select-all+accept \
  --bind=ctrl-d:half-page-down \
  --bind=ctrl-e:half-page-up
  --bind=ctrl-t:toggle+down
  --bind=ctrl-b:toggle+up
  --bind=ctrl-g:select-all+accept \
  "

# Powerline setup.
. $HOME/.nix-profile/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# Direnv setup.
eval "$($HOME/.nix-profile/bin/direnv hook zsh)"

# Terraform completions.
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/.nix-profile/bin/terraform terraform

# Kubectl completions.
source <(kubectl completion zsh)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


