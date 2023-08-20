{ pkgs, inputs, ... }:

{
  package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;

  enable = true;

  systemd = {
    enable = false;
    target = "graphical-session.target";
  };
}
