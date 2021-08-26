export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.histfile
export PATH=$PATH:~/.local/bin
# bash 调试显示行号
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
setopt APPEND_HISTORY

# 自带补全
autoload -U compinit
compinit

# 去重
setopt HIST_IGNORE_DUPS

# allow comments in interactive shells (like Bash does)
setopt INTERACTIVE_COMMENTS

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit load zdharma/history-search-multi-word
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load agkozak/zsh-z
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias pass='openssl rand -base64 16 >> pass'
bindkey \^U backward-kill-line

autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

alias time='\time -f %e'
alias p='export http_proxy=socks5://win:10808 && export https_proxy=socks5://win:10808'
alias hp='export http_proxy=http://win:10809 && export https_proxy=$http_proxy'
alias np='unset http_proxy && unset https_proxy'
