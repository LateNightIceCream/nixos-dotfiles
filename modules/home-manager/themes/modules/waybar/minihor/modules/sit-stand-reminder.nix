{
  #"interval" = "once";
  #"tooltip" = false;
  "return-type" = "json";
  #"escape" = true;

  #"interval" = "once";

  "format" = "{icon} {}";

  "format-icons" = {
      "sitting" = "󰽈";
      "standing" = "";
  };

  # might be better to create a derivation for the script
  "exec" = "~/.config/waybar/scripts/sit-stand-reminder.py serve 60 30";
  "on-click" = "~/.config/waybar/scripts/sit-stand-reminder.py toggle_pause";
  "on-click-right" = "~/.config/waybar/scripts/sit-stand-reminder.py skip";
}
