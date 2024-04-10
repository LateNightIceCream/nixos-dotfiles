{ config, pkgs, ... }:

{

  services.syncthing = {
      enable = true;
      extraOptions = [
      ];

      services.syncthing.settings.gui = import ./syncthing_credentials.nix;

    };

}
