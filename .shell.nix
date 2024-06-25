{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    # utils
    neovim
    nodejs # copilot
    git
    docker
    yq-go
    jq
    ripgrep
    fzf
    stow
    fzf-zsh
    zoxide
    # shell
    zsh
    oh-my-zsh
    oh-my-posh
    zsh-powerlevel10k
    antigen
    # devops
    awscli2
    kubectl
    #terraform # NIXPKGS_ALLOW_UNFREE=1
    opentofu
    open-policy-agent
    tflint
    checkov
  ];
}
