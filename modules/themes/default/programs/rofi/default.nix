{ lib, pkgs, user, home, ... }:
# { config, pkgs, inputs, user, colors, ... }:

{
  home.file.".config/rofi/themes/launcher_theme.rasi".source = ./themes/launcher_theme.rasi;
  home.file.".config/rofi/themes/colors.rasi".source = ./themes/colors.rasi;
}
