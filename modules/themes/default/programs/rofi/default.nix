{config, home, ...}:

{
  home.file.".config/rofi/themes/launcher_theme.rasi".source = ./themes/launcher_theme.rasi;
  #home.file.".config/rofi/themes/colors.rasi".source = ./themes/colors.rasi;
  home.file.".config/rofi/themes/colors.rasi".text = ''
    * {
      fg: #${config.colorScheme.colors.base05};
      bg: #${config.colorScheme.colors.base00};
      accent: #${config.colorScheme.colors.base0A};
      accent-fg: @bg;
      accent-bg: @accent;
      fg-hover: @fg;
      bg-hover: @bg;
      bg-border: #${config.colorScheme.colors.base02};
    }
  '';
}
