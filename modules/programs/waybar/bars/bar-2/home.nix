{ config, pkgs, inputs, user, ... }:

{
    programs.waybar = import ../../common.nix { inherit pkgs inputs; } // {

      style = (import ./style.nix.css) { inherit config; };

      settings = {

        mainBar = {
          layer = "top";
          position = "top";
          height = 32;

          margin-left = 733;
          margin-right = 733;

          modules-left = [
            # will only work with waybar>9.22 -> lets wait for nixpkgs stable
            "hyprland/workspaces" 
          ];

          modules-center = [
          ];

          modules-right = [
            "cpu"
            "pulseaudio"
            "clock"
          ];

          "hyprland/workspaces" = import ../../modules/workspace.nix;
          "backlight" = import ../../modules/backlight.nix;
          "clock" = import ../../modules/clock.nix;
          "pulseaudio" = import ../../modules/pulseaudio.nix;
          "memory" = import ../../modules/memory.nix;
          "cpu" = import ../../modules/cpu.nix;

        };

      };
    };
}


