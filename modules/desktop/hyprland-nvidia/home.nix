{config, lib, pkgs, ...}:

{

  imports = [
    (import ../../environment/hyprland-environment-variables.nix)
    (import ../../programs/wayland/launcher/rofi)
    #(import ../../themes/default)
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
    systemdIntegration = true;
    extraConfig = builtins.readFile ./config/hyprland.conf;
  };

  home.file.".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;

}
