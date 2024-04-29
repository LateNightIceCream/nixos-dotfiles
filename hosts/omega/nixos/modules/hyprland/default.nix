{ config, lib, pkgs, inputs, ... }:

{

  # TODO: for some reason it cannot find this in the HM module config
  # even though it should be there.
  # so maybe check back later so that this file can be removed.

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      #pkgs.xdg-desktop-portal-wlr 
      #pkgs.xdg-desktop-portal-gnome 
    ];
    config.common.default = "*";
  };
}
