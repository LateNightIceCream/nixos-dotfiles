{ lib, config, pkgs, ... }:

{

  imports = lib.mkThemeImports ../modules;

  options.lnicThemes.basicTheme = {
    enable = lib.mkEnableOption "enable the basic theme";
  };

  config = lib.mkIf config.lnicThemes.basicTheme.enable {
    # I had it like this before but decided against it
    # because of the large amount of boilerplate
    # and custom lib functions
    # myopts.kitty.theme.enable = true;
    # myopts.kitty.theme.choice = "fancy";

    programs.kitty.myopts.theme.basic.enable = true;
    programs.rofi.myopts.theme.launcher.fullscreen.enable = true;
    programs.sioyek.myopts.theme.basic.enable = true;
    programs.waybar.myopts.theme.minihor.enable = true;
    programs.waybar.myopts.theme.minihor.position = "top";

    programs.firefox.myopts.theme.sideberry.enable = true;
    # profile to apply the firefox theme to
    programs.firefox.myopts.theme.sideberry.profile = "default0";
    programs.firefox.myopts.theme.sideberry.tridactyl.enable = false;

    programs.fzf.myopts.theme.basic.enable = true;

    #programs.neovim.myopts.theme.basic.enable = true;
    programs.neovim.myopts.theme.bones.enable = true;

    programs.bash.myopts.theme.basic.enable = true;

    gtk.myopts.theme.colloid.enable = true;
    gtk.enable = true;

    services.dunst.myopts.theme.basic.enable = true;
    services.mako.myopts.theme.basic.enable = true;

    wayland.windowManager.hyprland.myopts.theme.basic.enable = true;

  };

}
