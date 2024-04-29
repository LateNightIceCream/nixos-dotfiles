{ config, pkgs, inputs, user, ... }:

{
    home.file.".config/waybar/scripts/sit-stand-reminder.py".source = ../../modules/scripts/sit-stand-reminder.py;

    programs.waybar = {

      style = (import ./style.nix.css) { inherit config; };

      settings = {

        mainBar = {
          layer = "top";
          position = "top";
          height = 32;

          margin-top = 8;

          margin-left = 852;
          margin-right = 733;

          modules-left = [
            # will only work with waybar>9.22 -> lets wait for nixpkgs stable
            "clock"
            "hyprland/workspaces" 
          ];

          modules-center = [
          ];

          modules-right = [
            #"cpu"
            #"pulseaudio"
            #"custom/sit-stand-reminder"
            #"clock"
          ];

          "hyprland/workspaces" = import ../../modules/workspace-circles.nix;
          "backlight" = import ../../modules/backlight.nix;
          "clock" = import ../../modules/clock.nix;
          "pulseaudio" = import ../../modules/pulseaudio.nix;
          "memory" = import ../../modules/memory.nix;
          "cpu" = import ../../modules/cpu.nix;
          #"custom/sit-stand-reminder" = import ../../modules/sit-stand-reminder.nix;

        };

      };
    };
}


