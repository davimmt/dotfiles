{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    ##################################
    # utils
    ##################################
    neovim
    nodejs # copilot
    git
    docker
    yq-go
    jq
    ripgrep
    fzf
    zoxide
    ##################################
    # shell
    ##################################
    zsh
    oh-my-zsh
    oh-my-posh
    zsh-powerlevel10k
    antigen
    ##################################
    # devops
    ##################################
    awscli2
    kubectl
    pre-commit
    #terraform # NIXPKGS_ALLOW_UNFREE=1
    opentofu
    open-policy-agent
    tflint
    checkov
  ];

  NIX_FZF = "${pkgs.fzf}";
  NIX_ANTIGEN = "${pkgs.antigen}";

  ##################################
  # fix for perl locale error
  LANGUAGE = "C";
  LC_ALL = "C.UTF-8";
  LANG = "C.UTF-8";
  LC_CTYPE = "C.UTF-8";
  ##################################
}
