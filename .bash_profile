# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ -e /home/yaxollum/.nix-profile/etc/profile.d/nix.sh ]; then . /home/yaxollum/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export SHELL=/home/yaxollum/.local/bin/xonsh
export EDITOR=/usr/bin/vimx
setfont -d

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS='@im=fcitx5'

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

PATH=~/bin:~/.local/bin:~/.local/share/gem/ruby/3.0.0/bin:~/.ghcup/bin:~/Qt/Tools/QtCreator/bin:$PATH
