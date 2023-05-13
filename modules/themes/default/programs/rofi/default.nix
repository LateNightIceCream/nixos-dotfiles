{ lib, pkgs, user, home, ... }:

{
  home.file.".config/rofi/themes/launcher_theme.rasi".source = ./themes/launcher_theme.rasi;
  home.file.".config/rofi/themes/colors.rasi".source = ./themes/colors.rasi;
}
