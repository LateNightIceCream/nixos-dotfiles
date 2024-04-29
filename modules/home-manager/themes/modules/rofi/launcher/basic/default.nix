{ lib, config, pkgs, home, ...}:

let 
  cfg = config.programs.rofi.myopts.theme.launcher.basic;
  enable = cfg.enable; #&& config.programs.rofi.enable; # note: rofi-wayland is not in home manager, so rofi.enable is not valid if using that package.
in
{
  options.programs.rofi.myopts.theme.launcher.basic.enable = lib.mkEnableOption "basic rofi launcher theme";

  config = lib.mkIf enable {
    home.file.".config/rofi/themes/launcher_theme.rasi".text = import ./basic-launcher.nix { inherit config; };
  };
}
