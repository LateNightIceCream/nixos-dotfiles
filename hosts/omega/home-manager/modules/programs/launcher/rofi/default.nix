{ config, pkgs, ... }:
{
  imports = [
    (import ./config)
  ];

  home = {
    packages = with pkgs; [
      rofi-wayland
    ];
  };
}
