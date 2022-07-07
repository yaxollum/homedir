# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ -e /home/yaxollum/.nix-profile/etc/profile.d/nix.sh ]; then . /home/yaxollum/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export SHELL=/usr/local/bin/xonsh
export EDITOR=/usr/bin/vimx
setfont -d

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS='@im=fcitx5'

PATH=$PATH:~/bin:~/.local/bin:~/.local/share/gem/ruby/3.0.0/bin
export SHELL=~/dev/xonsh/venv/bin/xonsh
