let kitty-class = "kitty-dropdown";
in {
  exec-once = [ "kitty --class=${kitty-class}" ];

  windowrule = [
    "float,${kitty-class}"
    #"workspace 1,${kitty-class}"
    "size 734 280,${kitty-class}"
    # move 8 pixel up by default (corner rounding)
    # its a hack since we cant set the rounding on individual 
    # corners with hyprland
    "move 593 -300,${kitty-class}"
  ];

  bind = [ "$mod, E, exec, $HOME/.config/hypr/scripts/dropdown.sh" ];

}
