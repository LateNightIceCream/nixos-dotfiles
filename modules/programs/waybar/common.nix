{ pkgs, inputs, ... }:

{
  #package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
  package = pkgs.waybar;

  enable = true;

  systemd = {
    enable = false;
    target = "graphical-session.target";
  };


}
