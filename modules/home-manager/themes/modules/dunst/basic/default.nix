{ lib, config, pkgs, ... }:

let
  cfg = config.services.dunst.myopts.theme.basic;
  enable = config.services.dunst.enable && cfg.enable;
in
{

  options.services.dunst.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable dunst basic theme";
  };

  config.services.dunst.settings = lib.mkIf enable {
    global = {

      font = "JetBrains Mono Regular 10";
      #font = "JuliaMono Regular 10";

      width = 300;
      height = 400;
      offset = "20x50";
      origin = "top-right";

      frame_width = 3;
      corner_radius = 12;

      transparency = 20;
      frame_color = "#${config.colorScheme.palette.base05}";

      # The height of a single line. If the height is smaller than the font height,
      # it will get raised to the font height.
      # This adds empty space above and under the text.
      line_height = 0;

      # Draw a line of 'separatpr_height' pixel height between two notifications.
      # Set to 0 to disable
      separator_height = 0;

      # padding between text and separator
      padding = 20;
      horizontal_padding = 30;

      # Scale larger icons down to this size, set to 0 to disable
      max_icon_size = 128;
      min_icon_size = 48;

      # Define a color for the separator.
      # possible values are:
      #  * auto: dunst tries to find a color fitting to the background
      #  * foreground: use the same color as the foreground
      #  * frame: use the same color as the frame.
      #  * anything else will be interpreted as a X color
      #separator_color = "${config.colorScheme.palette.base05}";

      # Size of gap to display between notifications.
      # If value is greater than 0, separator_height will be ignored and 
      # a border of size frame_width will be drawn around each notification instead.
      # This setting requires a compositor and any applications displayed 
      # between the gaps are not currently clickable.
      gap_size = 12;

      # browser for opening urls in context menu
      browser = "firefox -new-tab";

      # Sort messages by urgency
      sort = true;

      # Show how many messages are currently hidden (because of geometry)
      indicate_hidden = true;

       # Don't remove messages, if the user is idle (no mouse or keyboard input)
       # for longer than idle_threshold seconds.
       # Set to 0 to disable.
      idle_threshold = 120;

      icon_corner_radius = 8;

    };


    urgency_low = {
        background = "#${config.colorScheme.palette.base05}";
        foreground = "#${config.colorScheme.palette.base00}";
        frame_color = "#${config.colorScheme.palette.base04}";
        default_icon = "${./icons/info-light.svg}";
        timeout = 10;
    };


    urgency_normal = {
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base05}";
      frame_color = "#${config.colorScheme.palette.base02}";
      default_icon = "${./icons/info-dark.svg}";
      timeout = 0;
      #icon_position=
    };


    urgency_critical = {
      background = "#${config.colorScheme.palette.base08}";
      foreground = "#${config.colorScheme.palette.base00}";
      frame_color = "#${config.colorScheme.palette.base04}";
      default_icon = "${./icons/triangle-alert-light.svg}";
      timeout = 0;
    };

#    backgroundColor = "#${config.colorScheme.palette.base00}";
#    textColor = "#${config.colorScheme.palette.base05}";
#    borderSize = 2;
#    borderColor = "#${config.colorScheme.palette.base02}";

#    width = 280;
#    height = 173;

  };
}
