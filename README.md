# dotfiles

This will install my dotfiles and it's dependencies.

Also, I recommend using [this font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip) so you can see all the pretty icons.

---

First, clone this repository and its submodules:
```bash
git clone --recurse-submodules --depth 1 -b main https://github.com/davimmt/dotfiles ${HOME}/.dotfiles
```

Second, [install Flox](https://nix.dev/manual/nix/2.22/installation/installing-binary), if not already:
```bash
FLOX_VERSION=1.4.0
curl -LOs https://downloads.flox.dev/by-env/stable/deb/flox-${FLOX_VERSION}.x86_64-linux.deb
sudo dpkg -i flox-${FLOX_VERSION}.x86_64-linux.deb && \
rm flox-${FLOX_VERSION}.x86_64-linux.deb
cat >> ~/.bashrc <<EOF
( wsl.exe -d $WSL_DISTRO_NAME -u root service nix-daemon status 2>&1 >/dev/null ) || wsl.exe -d $WSL_DISTRO_NAME -u root service nix-daemon start
alias fa="SHELL=zsh flox activate -d ${HOME}/.dotfiles"
fa
EOF
```

Finally:
```bash
cd ${HOME}/.dotfiles
./run.sh
```

Optionally, install neovim config:
```bash
mkdir -p ~/.config
git clone --depth 1 -b main https://github.com/davimmt/nvim ${HOME}/.config/nvim
```

---

You can now access the environment by:
```bash
fa
```
