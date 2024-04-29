{ lib, config, pkgs, home, ... }:

let
  cfg = config.programs.waybar.myopts.theme.minihor;
  enable = cfg.enable && config.programs.waybar.enable;
in
{

  options.programs.waybar.myopts.theme.minihor = {
    enable = lib.mkEnableOption "enable waybar minihor theme";
    position = lib.mkOption {
      description = "position of the bar";
      type = lib.types.enum [ "top" "bottom" ];
      default = "top";
    };
  };


  config = lib.mkIf enable {

    home.file.".config/waybar/scripts/sit-stand-reminder.py".source = ./modules/scripts/sit-stand-reminder.py;

    programs.waybar = {

      style = (import ./style.nix.css) { inherit config; };

      settings = {

        mainBar = {
          layer = "top";
          position = cfg.position;
          height = 32;

          margin-top = if cfg.position == "top" then 8 else 0;
          margin-bottom = if cfg.position == "bottom" then 8 else 0;

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
          ];

          "hyprland/workspaces" = import ./modules/workspace-circles.nix;
          "clock" = import ./modules/clock.nix;
          #"custom/sit-stand-reminder" = import ../../modules/sit-stand-reminder.nix;

        };
      };
    };
  };
}
