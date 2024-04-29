{ config, lib, pkgs, ... }:

let
  hyprratio = { bc } : pkgs.writeShellScriptBin "hyprratio" ''
    if [ $# -ne 1 ]; then
      >&2 echo "Provide exactly one argument: ratio"
      exit 1
    fi

    case $1 in
      '\' | . | *[!0-9.]* | *.*.* ) exit 1 ;;
    esac

    ratio=$(${bc}/bin/bc<<<$1*2.0)
    hyprctl dispatch splitratio exact $ratio
  '';

  gresize = { bc, jq } : pkgs.writeShellScriptBin "gresize" ''

    if [ $# -eq 0 ]; then
      >&2 echo "Not enough arguments provided"
      exit 1
    fi

    _bc=${bc}/bin/bc
    _jq=${jq}/bin/jq
    width=$(hyprctl activewindow -j | $_jq -r ".size[0]")
    height=$(hyprctl activewindow -j | $_jq -r ".size[1]")
    floating=$(hyprctl activewindow -j | $_jq -r ".floating")

    if [ "$floating" = "false" ] ; then
      exit 1
    fi

    gr=1.618

    if [ ! -z $2 ] 
    then 
      level=$2
    else
      level=1
    fi

    # change height based on width
    if [ $1 = "-h" ]; then
      height=$(echo "$width/($gr^$level)" | $_bc)
    fi

    # change width based on height
    if [ $1 = "-w" ]; then
      width=$(echo "$height*(($gr-1)^$level)" | $_bc)
    fi

    LC_NUMERIC="en_US.UTF-8" # needed for printf if locale differs
    width=$(printf "%.0f\n" "$width")
    height=$(printf "%.0f\n" "$height")

    hyprctl dispatch resizeactive exact $width $height
  '';

in
{

  imports = [
    (import ../../environment/hyprland-environment-variables.nix)
  ];

  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';
    };
  };

  

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable  = true;
    settings = import ./config/settings.nix { inherit config; };
  };

  home.file.".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;

  # TODO: maybe move this into the kitty_dropdown.nix with writeShellScriptBin or up here
  home.file.".config/hypr/scripts/dropdown.sh".source = ./config/additional/scripts/dropdown.sh;

  home.packages = with pkgs; [
    (callPackage hyprratio {})
    (callPackage gresize {})
    hyprpaper
    waybar
  ];

  qt = {
    enable = true;
    platformTheme = "gtk3";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 11;
  };

  # not found???
  #xdg.portal =  {
  #  enable = true;
  #  wlr.enable = true;
  #  gtkUsePortal = true;
  #  extraPortals = [ 
  #    pkgs.xdg-desktop-portal-hyprland
  #    pkgs.xdg-desktop-portal-gtk 
      #pkgs.xdg-desktop-portal-wlr 
      #pkgs.xdg-desktop-portal-gnome 
  #  ];
  #  config.common.default = "*";
  #  xdgOpenUsePortal = true;
  #};

  home.sessionVariables.NIXOS_OZONE_WL = "1";

}
