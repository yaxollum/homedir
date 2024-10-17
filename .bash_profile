# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export SHELL=/home/yaxollum/.local/bin/xonsh
export EDITOR=/usr/bin/vimx
setfont -d

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS='@im=fcitx5'

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

export DIAGONATOR_ANALYTICS_FILE=~/.local/state/diagonator-analytics.db

PATH=~/bin:~/.local/bin:~/.cargo/bin:~/.local/share/gem/ruby/3.0.0/bin:~/.ghcup/bin:~/Qt/Tools/QtCreator/bin:~/tmp/kdesrc-build:~/.nvm/versions/node/v20.10.0/bin:~/.local/share/coursier/bin:$PATH
