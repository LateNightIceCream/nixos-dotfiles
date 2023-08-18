{config, lib, pkgs, inputs, ...}:

{

  imports = [
    #(import ../../programs/waybar/hyprland_waybar.nix)
  ];

  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    waybar
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-wlr 
      #pkgs.xdg-desktop-portal-gtk 
      #pkgs.xdg-desktop-portal-gnome 
    ];
  };

}
