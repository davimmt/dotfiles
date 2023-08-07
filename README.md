# .dotfiles

## zsh

Using zsh dotfiles by creating syslinks to your home (maybe -f is required, but will override existing conf).
```shell
for dotfile in $(ls -A zsh); 
do
  ln -s "$(pwd)/zsh/${dotfile}" "~/${dotfile}"; 
done
```
## nvim

Choose between `astronvim  kickstart-nvim  lunarvim  nvchad`. I only use NvChad now.

[NvChad](https://github.com/NvChad/NvChad)
```shell
ln -s "$(pwd)"/nvim/nvchad ~/.config/nvim/lua/custom
```

[AstroNvim](https://github.com/AstroNvim/AstroNvim)
```shell
ln -s "$(pwd)"/nvim/astronvim ~/.config/nvim/lua/user
```

[LunarVim](https://github.com/LunarVim/LunarVim)
```shell
ln -s "$(pwd)"/nvim/lunarvim/config.lua  ~/.config/lvim/config.lua
```

[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
```shell
ln -s "$(pwd)"/nvim/kickstart-nvim/custom.lua ~/.config/nvim/lua/custom/plugins/custom.lua
```
