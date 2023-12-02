{ config, pkgs, ...  }:

{

  home = {
    sessionVariables = {

      # this has to be set for some reason?
      GTK_THEME = "Colloid-Custom";

      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
      QT_QPA_PLATFORMTHEME = "gtk3";
      #QT_SCALE_FACTOR = "1";
      MOZ_ENABLE_WAYLAND = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XCURSOR_SIZE = "24";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      #QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      CLUTTER_BACKEND = "wayland";
      #KITTY_ENABLE_WAYLAND = "1";
      
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      # XDG_CACHE_HOME = "\${HOME}/.cache";
      # XDG_CONFIG_HOME = "\${HOME}/.config";
      # XDG_BIN_HOME = "\${HOME}/.local/bin";
      # XDG_DATA_HOME = "\${HOME}/.local/share";
    };
  };

}
