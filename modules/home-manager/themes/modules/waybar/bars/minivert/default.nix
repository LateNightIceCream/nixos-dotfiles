{ lib, config, pkgs, home, ... }:

let
  cfg = config.programs.waybar.myopts.theme.minivert;
  enable = cfg.enable && config.programs.waybar.enable;

in

{
  

  options.programs.waybar.myopts.theme.minivert = {
    enable = lib.mkEnableOption "enable minivert waybar";
    position = lib.mkOption {
      type = lib.types.enum [ "left" "right" ];
      default = "left";
    };

    vertPosition = lib.mkOption {
      type = lib.types.enum [ "top" "bottom" ];
      default = "bottom";
    };

  };


  config = lib.mkIf enable {
    programs.waybar = {

    settings = {
      mainBar = {

        layer = "top";
        position = cfg.position;

        width = 42;
        margin-left = lib.mkIf (cfg.position == "left") 8;
        margin-right = lib.mkIf (cfg.position == "right") 8;
        spacing = 15;

        height = 20;
        margin-bottom = 32;

        modules-left = lib.mkIf (cfg.vertPosition == "top") [ "hyprland/workspaces" "clock" ];
        modules-center = [  ];
        modules-right = lib.mkIf (cfg.vertPosition == "bottom") [ "hyprland/workspaces" "clock" ];

      "hyprland/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "urgent" = "";
          "active" = "";
          "default" = "";
        };
        sort-by-number = true;
      };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 1;
          format = "{:%H\n--\n%M}";
          rotate = 0;
        };

      };
    };

    style = ''

      * {
          /*font-family: "Cozette"; "mplus12";*/
          font-family: "JetBrains Mono";
          font-size: 11px;
          min-height: 0;
      }

      window#waybar {
          /*background-color: ${lib.hexToRgba config.colorScheme.palette.base00 "0.96"};*/
          background-color: #${config.colorScheme.palette.base00};
      }

      window#waybar.hidden {
          opacity: 0;
      }

      #workspaces button {
          padding:  10px 0px;
          background-color: transparent;
          color: #${config.colorScheme.palette.base05};
      }

      #workspaces button.persistent {
          padding:  10px 0px;
          background-color: transparent;
          color: #${config.colorScheme.palette.base05};
      }

      #workspaces button:hover {
        background-color: #${config.colorScheme.colors.base08};
        color: #${config.colorScheme.colors.base00};
        border-radius: 16px;
      }

      #workspaces button.active {
          color: #${config.colorScheme.palette.base0C};
      }

      #workspaces button.urgent {
          background-color: #1b1e28;
          color: #${config.colorScheme.palette.base0A};
      }

      #workspaces {
        padding-top: 16px;
      }

      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          color: #${config.colorScheme.palette.base05};
          font-size: 11px;
          margin-bottom: 32px;
      }

    '';
  };

  };

}
