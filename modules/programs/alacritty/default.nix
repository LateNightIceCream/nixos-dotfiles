{ config, lib, pkgs, ...}:

{

  programs = {
    alacritty = {
      enable = true;
      settings = import ./config.nix;
    };
  };

}
