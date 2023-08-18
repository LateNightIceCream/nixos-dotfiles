{ config, pkgs, ... }:

{

  programs = {

    kitty = {
      enable = true;
      environment = { };
      keybindings = { };
      # extraConfig = builtins.readFile ./config/kitty.conf;
    };

  };

}
