{ config, lib, pkgs, ... }:

{

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      withPython3 = true;

      extraPython3Packages = pyPkgs: with pyPkgs; [
        pylint
      ];

      plugins = with pkgs.vimPlugins; [
        yankring
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

  home.file.".config/nvim/init.lua".source = ./lua/options.lua;

}
