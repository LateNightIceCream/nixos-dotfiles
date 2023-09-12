{config, home, ...}:

{
  programs.kitty = {

    font.name = "JetBrains Mono Medium";
    font.size = 10;

    settings = {

      bold_font = "JetBrains Mono Bold";

      # symbol_map codepoints Font Family Name
      symbol_map  = "U+F264,U+F2FA,U+F510,U+F20B,U+F28E,U+F42F,U+F230 lucide";

      window_padding_width = "8 24";
      # colors
      foreground = "#${config.colorScheme.colors.base05}";
      background = "#${config.colorScheme.colors.base00}";

      selection_foreground = "#${config.colorScheme.colors.base05}";
      selection_background = "#${config.colorScheme.colors.base0F}";

      cursor = "#${config.colorScheme.colors.base07}";
      cursor_text_color = "#${config.colorScheme.colors.base05}";

      url_color = "#${config.colorScheme.colors.base0D}";

      # black
      color0 = "#${config.colorScheme.colors.base00}";
      color8 = "#${config.colorScheme.colors.base0A}";

      # red
      color1 = "#${config.colorScheme.colors.base0A}";
      color9 = "#${config.colorScheme.colors.base0A}";

      # green
      color2 = "#${config.colorScheme.colors.base0B}";
      color10 = "#${config.colorScheme.colors.base0B}";

      # yellow
      color3 = "#${config.colorScheme.colors.base09}";
      color11 = "#${config.colorScheme.colors.base09}";

      # blue
      color4 = "#${config.colorScheme.colors.base0C}";
      color12 = "#${config.colorScheme.colors.base0C}";

      # magenta
      color5 = "#${config.colorScheme.colors.base0D}";
      color13 = "#${config.colorScheme.colors.base0D}";

      # cyan
      color6 = "#${config.colorScheme.colors.base0A}";
      color14 = "#${config.colorScheme.colors.base0A}";

      # white
      color7 = "#${config.colorScheme.colors.base05}";
      color15 = "#${config.colorScheme.colors.base0A}";
    };

  };
}
