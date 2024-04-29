{ lib, config, home, ... }:

let
  cfg = config.programs.firefox.myopts.theme.sideberry;
  enable = cfg.enable && config.programs.firefox.enable;
in {

  options.programs.firefox.myopts.theme.sideberry = {

    enable = lib.mkEnableOption "enable firefox sideberry theming";

    profile = lib.mkOption {
      description = ''
        Profile name to apply this theme to. 
        Has no default value because it is required.
      '';
      type = lib.types.str;
    };

    tridactyl.enable =
      lib.mkEnableOption "enable tridactyl theming (currently WIP)";

  };

  config = lib.mkIf enable {

    programs.firefox.profiles = {

      ${cfg.profile} = {
        userContent = lib.mkIf cfg.tridactyl.enable
          ((import ./trydactyl.css.nix) { inherit config; });

        userChrome = ''
          /* hides the native tabs */
          #TabsToolbar {
            visibility: collapse !important;
          }

          /**
           * Decrease size of the sidebar header (sideberry)
           */
          #sidebar-header {
            font-size: 1.2em !important;
            padding: 2px 6px 2px 3px !important;
            display: none !important;
          }
          #sidebar-header #sidebar-close {
            padding: 3px !important;
          }
          #sidebar-header #sidebar-close .toolbarbutton-icon {
            width: 14px !important;
            height: 14px !important;
            opacity: 0.6 !important;
          }
        '';
      };
    };

  };
}
