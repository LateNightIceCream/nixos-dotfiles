{ lib, config, pkgs, home, ...}:

let
  cfg = config.wayland.windowManager.hyprland.myopts.theme.basic;
  enable = cfg.enable && config.wayland.windowManager.hyprland.enable;
in
{

  options.wayland.windowManager.hyprland.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable hyprland basic theme";
  };

  config = lib.mkIf enable {

    wayland.windowManager.hyprland.settings = {

      general = {
        gaps_in = 8;
        gaps_out = 16;
        border_size = 2;
        layout = "dwindle";
        "col.active_border" = "rgba(${config.colorScheme.colors.base02}ff)";
        "col.inactive_border" = "rgba(${config.colorScheme.colors.base00}ff)";
      };

      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          xray = true;
          ignore_opacity = true;
        };

        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "1 2";
        shadow_range = 10;
        shadow_render_power = 5;
        "col.shadow" = "0x66404040";

      };
    };
  };

}
