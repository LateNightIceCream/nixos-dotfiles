{ lib, config, pkgs, ... }:

{

  programs.firefox.profiles = {
    default0 = {
      id = 0;
      isDefault = true;
      settings = {
        # enable userChrome
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
    default1 = { # just a dummy profile because sometimes the above does not build
      id = 1;
      isDefault = false;
    };
  };

  programs.firefox.package = pkgs.firefox.override {
    # See nixpkgs' firefox/wrapper.nix to check which options you can use
    nativeMessagingHosts = [
      # Gnome shell native connector
      pkgs.gnome-browser-connector
    ];
  };

}
