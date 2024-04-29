{ lib, config, pkgs, home, ... }:

let
  cfg = config.services.mako.myopts.theme.basic;
  enable = cfg.enable && config.services.mako.enable;
in {

  options.services.mako.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable mako basic theme";
  };

  config = lib.mkIf enable {
    services.mako = {

      #font = "JetBrains Mono Regular 10";
      font = "JuliaMono Regular 10";

      backgroundColor = "#${config.colorScheme.colors.base00}";
      textColor = "#${config.colorScheme.colors.base05}";
      borderRadius = 8;
      borderSize = 2;
      borderColor = "#${config.colorScheme.colors.base02}";

      width = 280;
      height = 173;

    };
  };
}
