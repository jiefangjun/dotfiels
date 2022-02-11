export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.histfile
export JAVA_HOME=/usr/lib/jvm/default
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt APPEND_HISTORY

# bash 调试显示行号
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
setopt APPEND_HISTORY

# 自带补全
autoload -U compinit
compinit

# allow comments in interactive shells (like Bash does)
setopt INTERACTIVE_COMMENTS

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  sh -c "$(curl -fsSL https://git.io/zinit-install)"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit load zdharma-continuum/history-search-multi-word
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load agkozak/zsh-z
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey \^U backward-kill-line

autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

alias time='\time -f %e'
alias p='export http_proxy=socks5://win:10808 && export https_proxy=socks5://win:10808'
alias hp='export http_proxy=http://win:10809 && export https_proxy=$http_proxy'
alias np='unset http_proxy && unset https_proxy'

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
