# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ -e /home/yaxollum/.nix-profile/etc/profile.d/nix.sh ]; then . /home/yaxollum/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export SHELL=/usr/local/bin/xonsh
export EDITOR=/usr/bin/vi
setfont -d
. "$HOME/.cargo/env"
