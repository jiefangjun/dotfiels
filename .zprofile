echo -ne "\033]0;$(hostname)\a"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
PATH="$PATH:$GEM_HOME/bin"
PATH=$PATH:~/.local/bin
PATH=$PATH:~/go/bin
