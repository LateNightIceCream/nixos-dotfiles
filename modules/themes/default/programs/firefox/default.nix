{config, home, ...}:

{
  programs.firefox.profiles = {

    default0 = {
      id = 0;
      isDefault = true;

      settings = {
      };

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
}
