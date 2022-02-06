echo -ne "\033]0;$(cat $PREFIX/etc/hostname)\a"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
PATH="$PATH:$GEM_HOME/bin"
PATH=$PATH:~/.local/bin
PATH=$PATH:~/go/bin
if [ -v PREFIX ]
then
        SERVICE="sshd"
        if pgrep -x "$SERVICE" >/dev/null
        then
                echo "$SERVICE is running"
        else
                sshd
                python DDNS/run.py -c DDNS/config.json
                echo "$SERVICE started"
        fi
fi
