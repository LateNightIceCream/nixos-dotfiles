{ lib, config, pkgs, home, ...}:

let 
  cfg = config.programs.rofi.myopts.theme.launcher.fullscreen;
  enable = cfg.enable; #&& config.programs.rofi.enable;
in
{
  options.programs.rofi.myopts.theme.launcher.fullscreen.enable =
    lib.mkEnableOption "fullscreen rofi launcher theme";

  config = lib.mkIf enable {
    home.file.".config/rofi/themes/launcher_theme.rasi".text = import ./launcher-fullscreen.nix { inherit config; };
  };
}
