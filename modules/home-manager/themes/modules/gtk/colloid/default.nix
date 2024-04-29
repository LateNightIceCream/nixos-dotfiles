{ lib, config, pkgs, home, ... }:

let
  cfg = config.gtk.myopts.theme.colloid;
  enable = cfg.enable && config.gtk.enable;

  # stupid version but idk how to capitalize it
  themeKindCapitalized = builtins.replaceStrings [ "l" "d" ] [ "L" "D" ]
    "${config.colorScheme.kind}";
  themeName = "Colloid-Custom-${themeKindCapitalized}";
  colorScheme = config.colorScheme;

in {

  options.gtk.myopts.theme.colloid = {
    enable = lib.mkEnableOption "enable custom colloid gtk theme";
  };

  config = lib.mkIf enable {

    gtk.theme = {
      name = themeName;
      package = pkgs.callPackage ./theme/pkg { inherit colorScheme; };
    };

    gtk.iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

    # make sure to set the GTK_THEME env variable 
    # because it does not get set for some reason
    home.sessionVariables.GTK_THEME = "Colloid-Custom";

  };

}
