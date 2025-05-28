# dotfiles

This will install my dotfiles and it's dependencies.

Also, I recommend using [this font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip) so you can see all the pretty icons.

---

Prerequisites:
```bash
sudo curl git xz-utils unzip vim xclip
```

First, clone this repository and its submodules:
```bash
git clone --recurse-submodules --depth 1 -b main https://github.com/davimmt/dotfiles ${HOME}/.dotfiles
```

Second, [install Flox](https://flox.dev/docs/install-flox/):
```bash
FLOX_VERSION=1.4.0
curl -LOs https://downloads.flox.dev/by-env/stable/deb/flox-${FLOX_VERSION}.x86_64-linux.deb
sudo dpkg -i flox-${FLOX_VERSION}.x86_64-linux.deb && \
rm flox-${FLOX_VERSION}.x86_64-linux.deb
cat >> ~/.bashrc <<'EOF'
( wsl.exe -d $WSL_DISTRO_NAME -u root service nix-daemon status 2>&1 >/dev/null ) \
  || wsl.exe -d $WSL_DISTRO_NAME -u root service nix-daemon start
alias fa="SHELL=zsh flox activate -d ${HOME}/.dotfiles"
fa
EOF
```

---

You can now access the environment by:
```bash
fa
```

---


Optionally, install neovim config:
```bash
mkdir -p ~/.config
git clone --depth 1 -b main https://github.com/davimmt/nvim ${HOME}/.config/nvim
```
If nvim-term, althought it can source the zsh config, still opens zsh configuration message, create an empty file:
```bash
touch ${HOME}/.zshenv
```

If nvim-term can't source your zsh environment, symlink the .zshrc:
```bash
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
```

---

If you are using Bitwarden:
```bash
echo -n "Bitwarden master password: " && read -s i && echo -nE "$i" > "$BW_MASTERPASSWORD_FILE"

```
