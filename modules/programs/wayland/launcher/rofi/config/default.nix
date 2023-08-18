{ lib, pkgs, user, home, ... }:
{
  home.file.".config/rofi/scripts/launcher.sh".source = ./scripts/launcher.sh;
}
