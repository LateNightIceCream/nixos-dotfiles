{ lib, config, pkgs, outputs, ... }:

let
  cfg = config.programs.kitty.myopts.theme.fancy;
  enable = config.programs.kitty.enable && cfg.enable;
in {
  options.programs.kitty.myopts.theme.fancy = {
    enable = lib.mkEnableOption "enable kitty fancy theme";
  };

  config.programs.kitty = lib.mkIf enable {

    font.name = "JetBrains Mono Regular";
    # font.name = "JuliaMono Regular";
    font.size = 10;

    settings = {

      bold_font = "JetBrains Mono Bold";
      #bold_font = "JuliaMono Bold";

      # symbol_map codepoints Font Family Name
      symbol_map =
        "U+F264,U+F2FA,U+F510,U+F20B,U+F28E,U+F42F,U+F230,U+F1FD,U+F1EF lucide";

      window_padding_width = "8 24";

      # colors
      foreground = "#${config.colorScheme.palette.base05}";
      #background = "#${config.colorScheme.palette.base00}";
      background = "#00ff00";

      selection_foreground = "#${config.colorScheme.palette.base05}";
      selection_background = "#${config.colorScheme.palette.base0F}";

      cursor = "#${config.colorScheme.palette.base07}";
      cursor_text_color = "#${config.colorScheme.palette.base05}";

      url_color = "#${config.colorScheme.palette.base0D}";

      # black
      color0 = "#${config.colorScheme.palette.base00}";
      color8 = "#${config.colorScheme.palette.base0A}";

      # red
      color1 = "#${config.colorScheme.palette.base0A}";
      color9 = "#${config.colorScheme.palette.base0A}";

      # green
      color2 = "#${config.colorScheme.palette.base0B}";
      color10 = "#${config.colorScheme.palette.base0B}";

      # yellow
      color3 = "#${config.colorScheme.palette.base09}";
      color11 = "#${config.colorScheme.palette.base09}";

      # blue
      color4 = "#${config.colorScheme.palette.base0C}";
      color12 = "#${config.colorScheme.palette.base0C}";

      # magenta
      color5 = "#${config.colorScheme.palette.base0D}";
      color13 = "#${config.colorScheme.palette.base0D}";

      # cyan
      color6 = "#${config.colorScheme.palette.base0A}";
      color14 = "#${config.colorScheme.palette.base0A}";

      # white
      color7 = "#${config.colorScheme.palette.base05}";
      color15 = "#${config.colorScheme.palette.base0A}";
    };

  };
}
