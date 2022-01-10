# 🐇 user.nvim

> A basic, maintainable Neovim distribution.

### Requirements

Required to run `user.nvim`:
- [neovim](https://neovim.io/) ≥0.6.0
- [git](https://git-scm.com/)
- [python3](https://docs.python.org/3/) & [pip](https://pip.pypa.io/en/stable/)
- [node.js](https://nodejs.org/) & [npm](https://www.npmjs.com/) & [yarn](https://yarnpkg.com/)

Optional:
- [neovim-qt](https://github.com/equalsraf/neovim-qt) (for graphical user interface)
- [bat](https://github.com/sharkdp/bat) & [fd](https://github.com/sharkdp/fd) &
  [ripgrep](https://github.com/BurntSushi/ripgrep)
  (for [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) commands)
- other language runtimes
  (see [`nvim-lsp-installer`](https://github.com/williamboman/nvim-lsp-installer) documentation)

You can install these via your package manager, e.g,
```sh
# Ubuntu-based Linux
sudo apt install neovim neovim-qt git python3 python3-pip nodejs npm yarnpkg bat fd-find ripgrep

# Arch-based Linux
sudo pacman -Syu neovim neovim-qt git python3 python3-pip nodejs npm yarn bat fd ripgrep
```

> **Note: Neovim 0.6.X is currently in development and it might need to be manually installed.**

### Installing `user.nvim`

Git clone the `user.nvim` repository into `~/.config/nvim` (after backing up your own Neovim files):
```sh
# Back up your Neovim files
mv ~/.config/nvim ~/.config/nvim_bak
mv ~/.cache/nvim ~/.cache/nvim_bak
mv ~/.local/share/nvim ~/.local/share/nvim_bak

# Install `user.nvim`
git clone https://github.com/msricher/user.nvim.git ~/.config/nvim
cd ~/.config/nvim
```

Open `nvim` to configure `user.nvim`:
```sh
nvim README.md
```

Finally, restart `nvim` to load your new configuration. Note that Treesitter parsers and LSP servers
will install asynchronously in the background and may take several minutes each to complete.

### Configuring `user.nvim`

`user.nvim` can be configured by editing the `init.lua` file of each submodule. For example, to
modify the user interface, edit `lua/ui/init.lua`:
```sh
nvim lua/ui/init.lua
```
