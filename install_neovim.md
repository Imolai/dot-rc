# Install Neovim

## Get the binary Neovim

- https://github.com/neovim/neovim/releases
  https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
- (unsupported) builds for older glibc: https://github.com/neovim/neovim-releases/releases
  https://github.com/neovim/neovim-releases/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz

```bash
# unpack
cd
tar xvzf nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 neovim

# make it reachable command
echo -e '\nexport PATH="$PATH:$HOME/neovim/bin"\n' >> $HOME/.bashrc
. $HOME/.bashrc
```

## (Optional) Use my init config

[nvim init.lua](./.config/nvim/init.lua).

## (Optional) Install LazyVim

```bash
# make a backup of your current Neovim files
# required
mv ~/.config/nvim{,.bak}
# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# clone the starter
git clone https://github.com/LazyVim/starter ~/.config/nvim

# remove the .git folder, so you can add it to your own repo later
rm -rf ~/.config/nvim/.git
```

## Start Neovim

```bash
nvim
```
