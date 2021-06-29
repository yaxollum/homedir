# homedir
This Git repository contains the configuration files and other resources such as scripts and wallpapers in my home directory. [Drew DeVault's "Managing my dotfiles as a git repository"](https://drewdevault.com/2019/12/30/dotfiles.html) inspired me to use this method to manage my setup.

## Installation (modified from Drew Devault's guide)

```bash
cd ~
git init
git remote add origin git@github.com:yaxollum/homedir.git
git fetch
git checkout -f main
```
