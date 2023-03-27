{ config, lib, pkgs, ... }:

{

  programs = {
    neovim = {
      enable = true;
      withPython3 = true;
      plugins = with pkgs.vimPlugins; [
              ];
    };
  };

  home = {
    packages = with pkgs; [
      rnix-lsp
      pyright
      rust-analyzer
      rustfmt
      clang-tools
      tree-sitter
      black
      nixpkgs-fmt
    ];
  };

}
