{config, lib, pkgs, ...}:

{

  imports = [
    (import ../../environment/hyprland-environment-variables.nix)
    (import ../../programs/wayland/launcher/rofi)
    (import ../../programs/waybar/bars.nix).bar-2
  ];

  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemdIntegration = true;
    extraConfig = builtins.readFile ./config/hyprland.conf;
    #settings = import ./config/settings.nix { inherit config; };
  };

  home.file.".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;

}
