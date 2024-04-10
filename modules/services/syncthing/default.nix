{ config, pkgs, ... }:

{

  programs = {
    services.syncthing = {
      enable = true;
      extraOptions = [
      ];
    };
  };

}
