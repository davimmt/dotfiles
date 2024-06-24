# dotfiles

This will install my dotfiles and it's dependencies. 

Also, I recommend using [this font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip) so you can see all the pretty icons.

---

First, clone this repository and its submodules:
```bash
git clone --recurse-submodules https://github.com/davimmt/.dotfiles ${HOME}/.dotfiles
```

Second, [install Nix](https://nix.dev/manual/nix/2.22/installation/installing-binary), if not already:
```bash
curl -L https://nixos.org/nix/install | sh
eval $(tee -a ${HOME}/.bashrc <<< 'export PATH="${PATH}:${HOME}/.nix-profile/bin"')
```

Finally:
```bash
cd $HOME/.dotfiles
nix-shell -p stow --run "stow -vv --ignore='^[^\.].*' ."
```

---

You can now access the environment by:
```bash
NIXPKGS_ALLOW_UNFREE=1 nix-shell ${HOME}/.shell.nix --command zsh
```
