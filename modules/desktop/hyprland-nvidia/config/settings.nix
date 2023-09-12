#
# ▀██▀  ▀██▀                            ▀██                       ▀██  
#  ██    ██   ▄▄▄▄ ▄▄▄ ▄▄▄ ▄▄▄  ▄▄▄ ▄▄   ██   ▄▄▄▄   ▄▄ ▄▄▄     ▄▄ ██  
#  ██▀▀▀▀██    ▀█▄  █   ██▀  ██  ██▀ ▀▀  ██  ▀▀ ▄██   ██  ██  ▄▀  ▀██  
#  ██    ██     ▀█▄█    ██    █  ██      ██  ▄█▀ ██   ██  ██  █▄   ██  
# ▄██▄  ▄██▄     ▀█     ██▄▄▄▀  ▄██▄    ▄██▄ ▀█▄▄▀█▀ ▄██▄ ██▄ ▀█▄▄▀██▄ 
#             ▄▄ █      ██                                             
#              ▀▀      ▀▀▀▀                                            

{ config, ...}:

{

  "$mod" = "ALT";

  monitor = [ 
    "HDMI-A-1,preferred,auto,1"
    "VGA-1,preferred,auto,1,transform,1"
    ",preferred,auto,1"
  ];

  exec-once = [
    "hyprpaper"
    "waybar"
  ];

  env = [
    "XCURSOR_SIZE,24"
  ];

  input = {
    kb_layout = "de";
    follow_mouse = "1";
    sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.
  };

  general = {
    gaps_in = 4;
    gaps_out = 16;
    border_size = 2;
    layout = "dwindle";
    "col.active_border" = "rgba(ebbcbaaa)";
    "col.inactive_border" = "rgba(26233aaa)";
  };

  decoration = {
    rounding = 8;

    blur = {
      enabled = true;
      size = 6;
      passes = 3;
      new_optimizations = true;
      ignore_opacity = true;
    };

    drop_shadow = true;
    shadow_range = 6;
    shadow_render_power = 2;
    shadow_offset = "0 5";
    "col.shadow" = "rgba(00000099)";
  };

  dwindle = {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # you probably want this
  };

  master = {
    new_is_master = true;
  };

  bind = [
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    "$mod, return, exec, kitty"
    "$mod SHIFT, Q, killactive,"
    "$mod, E, exec, dolphin"
    "$mod, V, togglefloating,"
    "$mod, D, exec, rofi -show drun -theme launcher_theme"
    "$mod, P, pseudo," # dwindle
    "$mod, J, togglesplit," # dwindle

    # Move focus with mainMod + arrow keys
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"

    # Switch workspaces with mainMod + [0-9]
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"
    "$mod SHIFT, 7, movetoworkspace, 7"
    "$mod SHIFT, 8, movetoworkspace, 8"
    "$mod SHIFT, 9, movetoworkspace, 9"
    "$mod SHIFT, 0, movetoworkspace, 10"

    # Scroll through existing workspaces with mainMod + scroll
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up, workspace, e-1"
  ];

  bindm = [
    # mouse movements
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

}
