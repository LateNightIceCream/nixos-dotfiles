{ lib, config, pkgs, ... }:

let

  paletto1 = (import ./custom.lua.nix) { inherit config; };
  paletto2 = (import ./custom.vim.nix) { inherit config; };

in pkgs.vimPlugins.nvim-base16.overrideAttrs (final: prev: {
  pname = "nvim-base16-custom";
  version = "2023-11-06";
  preInstall = prev.preInstall + ''
    echo "${paletto1}" > ./lua/colors/custom.lua
    echo "${paletto2}" > ./colors/base16-custom.vim
  '';
})
