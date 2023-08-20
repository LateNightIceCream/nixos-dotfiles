{ config, pkgs, inputs, user, ... }:

{
    programs.waybar = import ../../common.nix { inherit pkgs inputs; } // {

      style = (import ./style.nix.css) { inherit config; };

      settings = {

        mainBar = {
          layer = "top";
          position = "top";
          height = 32;

          modules-left = [
            "wlr/workspaces"
          ];

          modules-center = [
          ];

          modules-right = [
            #"pulseaudio"
            "clock"
          ];

          "wlr/workspaces" = import ../../modules/workspace.nix;
          "backlight" = import ../../modules/backlight.nix;
          "clock" = import ../../modules/clock.nix;
          "pulseaudio" = import ../../modules/pulseaudio.nix;

        };

      };
    };
}


