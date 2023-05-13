{ lib, pkgs, user, home, ... }:

{
  imports = [
    ./programs/rofi
  ];

  #config.colors = mkOption {
  #  default = { };
  #  col1 = {"hello"};
  #};
}
