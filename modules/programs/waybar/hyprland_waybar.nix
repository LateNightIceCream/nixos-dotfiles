{ config, pkgs, inputs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
  ];

  home-manager.users.${user} = {
    # Home-manager waybar config
    programs.waybar = {

      package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;

      enable = true;

      systemd = {
        enable = false;
        target = "graphical-session.target";
      };

      style = builtins.readFile ./config/style.css;    

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;

          modules-left = [
            "wlr/workspaces"
          ];

          modules-center = [
          ];

          modules-right = [
            "battery"
            "backlight"
          ];

          "hyprland/workspaces" = {
            format = "{id}: {icon}";
            format-icons = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
              "active" = "";
              "default" = "";
            };
          };

        };

#      "layer" = "top";
#      "position" = "top";

#      modules-left = [
#      "custom/launcher"
#      "wlr/workspaces"
#      "temperature"
#      #"idle_inhibitor"
#      "custom/wall"
#      "mpd"
#      "custom/cava-internal"
#      ];

#      modules-center = [
#      "clock"
#      ];

#      modules-right = [
#      "pulseaudio"
#      "backlight"
#      "memory"
#      "cpu"
#      "network"
#      "battery"
#      "custom/powermenu"
#      "tray"
#      ];

#      "custom/launcher" = {
#      "format" = " ";
#      "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
#      "tooltip" = false;
#      };

#      "custom/wall" = {
#      "on-click" = "wallpaper_random";
#      "on-click-middle" = "default_wall";
#      "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
#      "format" = " ﴔ ";
#      "tooltip" = false;
#      };

#      "custom/cava-internal" = {
#      "exec" = "sleep 1s && cava-internal";
#      "tooltip" = false;
#      };

#      "wlr/workspaces" = {
#      "format" = "{icon}";
#      "on-click" = "activate";
## "on-scroll-up" = "hyprctl dispatch workspace e+1";
## "on-scroll-down" = "hyprctl dispatch workspace e-1";
#      };

#      "idle_inhibitor" = {
#      "format" = "{icon}";
#      "format-icons" = {
#      "activated" = "";
#      "deactivated" = "";
#      };
#      "tooltip" = false;
#      };
#      "backlight" = {
#      "device" = "intel_backlight";
#      "on-scroll-up" = "light -A 5";
#      "on-scroll-down" = "light -U 5";
#      "format" = "{icon} {percent}%";
#      "format-icons" = [ "" "" "" "" ];
#      };
#      "pulseaudio" = {
#      "scroll-step" = 1;
#      "format" = "{icon} {volume}%";
#      "format-muted" = "婢 Muted";
#      "format-icons" = {
#      "default" = [ "" "" "" ];
#      };
#      "states" = {
#      "warning" = 85;
#      };
#      "on-click" = "pamixer -t";
#      "tooltip" = false;
#      };
#      "battery" = {
#      "interval" = 10;
#      "states" = {
#      "warning" = 20;
#      "critical" = 10;
#      };
#      "format" = "{icon} {capacity}%";
#      "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
#      "format-full" = "{icon} {capacity}%";
#      "format-charging" = " {capacity}%";
#      "tooltip" = false;
#      };
#      "clock" = {
#      "interval" = 1;
#      "format" = "{:%I:%M %p  %A %b %d}";
#      "tooltip" = true;
#      /* "tooltip-format"= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>" */
#      "tooltip-format" = "上午：高数\n下午：Ps\n晚上：Golang\n<tt>{calendar}</tt>";
#      };
#      "memory" = {
#      "interval" = 1;
#      "format" = "﬙ {percentage}%";
#      "states" = {
#      "warning" = 85;
#      };
#      };
#      "cpu" = {
#      "interval" = 1;
#      "format" = " {usage}%";
#      };
#      "mpd" = {
#      "max-length" = 25;
#      "format" = "<span foreground='#bb9af7'></span> {title}";
#      "format-paused" = " {title}";
#      "format-stopped" = "<span foreground='#bb9af7'></span>";
#      "format-disconnected" = "";
#      "on-click" = "mpc --quiet toggle";
#      "on-click-right" = "mpc update; mpc ls | mpc add";
#      "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
#      "on-scroll-up" = "mpc --quiet prev";
#      "on-scroll-down" = "mpc --quiet next";
#      "smooth-scrolling-threshold" = 5;
#      "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
#      };
#      "network" = {
#      "interval" = 1;
#      "format-wifi" = "說 {essid}";
#      "format-ethernet" = "  {ifname} ({ipaddr})";
#      "format-linked" = "說 {essid} (No IP)";
#      "format-disconnected" = "說 Disconnected";
#      "tooltip" = false;
#      };
#      "temperature" = {
## "hwmon-path"= "${env:HWMON_PATH}";
##"critical-threshold"= 80;
#      "tooltip" = false;
#      "format" = " {temperatureC}°C";
#      };
#      "custom/powermenu" = {
#      "format" = "";
#      "on-click" = "pkill rofi || ~/.config/rofi/powermenu.sh";
#      "tooltip" = false;
#      };
#      "tray" = {
#      "icon-size" = 15;
#      "spacing" = 5;
#      };
      };
      };
    };
}
