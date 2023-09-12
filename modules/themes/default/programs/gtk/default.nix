{config, home, pkgs, ...}:

let
  # stupid version but idk how to capitalize it
  themeKindCapitalized = builtins.replaceStrings ["l" "d"] ["L" "D"] "${config.colorScheme.kind}";
in
{

  gtk = { 
    enable = true;
    theme = {
      # name = "Colloid-Custom-Light"; # make sure to set the GTK_THEME env variable bc it does not get set for some reason
      name = "Colloid-Custom-${themeKindCapitalized}"; # make sure to set the GTK_THEME env variable bc it does not get set for some reason
      package = pkgs.colloid-custom; # see overlays directory
    };
    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };
  };

}
