{ lib, pkgs, config, user, home, ... }:
#{ config, pkgs, inputs, user, colors, ... }:
{
  imports = [
    ./programs/rofi
    ./programs/kitty
    ./programs/neovim
  ];
}
