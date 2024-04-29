{ config, home, inputs, lib, ... }:

let

  cfg = config.programs.sioyek.myopts.theme.basic;
  enable = cfg.enable && config.programs.sioyek.enable;

  # returns list of rgb colors with range 0.0 .. 1.0
  hexToRGBNormalized = hexstr:
    let rgbList = inputs.nix-colors.lib.conversions.hexToRGB hexstr;
    in builtins.map (c: c / 255.0) rgbList;

  hexToRGBStringNormalized = sep: hex:
    let
      inherit (builtins) map toString;
      inherit (lib) concatStringsSep;
      hexInRGB = hexToRGBNormalized hex;
      hexInRGBString = map toString hexInRGB;
    in concatStringsSep sep hexInRGBString;

  sioyekCol = hexstr: hexToRGBStringNormalized " " hexstr;

in {

  options.programs.sioyek.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable sioyek basic theme";
  };

  config = lib.mkIf enable {
    # see https://github.com/ahrm/sioyek/blob/main/pdf_viewer/prefs.config
    programs.sioyek.config = {
      "text_highlight_color" = sioyekCol config.colorScheme.colors.base09;
      "custom_background_color" = sioyekCol config.colorScheme.colors.base00;
      "custom_text_color" = sioyekCol config.colorScheme.colors.base05;
      "status_bar_color" = sioyekCol config.colorScheme.colors.base00;
      "status_bar_text_color" = sioyekCol config.colorScheme.colors.base05;
    };
  };
}
