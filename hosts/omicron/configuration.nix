# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, user, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware.bluetooth.enable = true;

  ## -----------------------------------------------------------------------
  ## BOOTLOADER
  ## -----------------------------------------------------------------------

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";


  ## -----------------------------------------------------------------------
  ## NETWORKING
  ## -----------------------------------------------------------------------

  networking.hostName = "omicron"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  ## -----------------------------------------------------------------------
  ## LOCALE
  ## -----------------------------------------------------------------------

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";


  ## -----------------------------------------------------------------------
  ## USERS
  ## -----------------------------------------------------------------------

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    # packages = with pkgs; [];
  };


  ## -----------------------------------------------------------------------
  ## PACKAGES
  ## -----------------------------------------------------------------------

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

     vim
     wget
     git
     xdg-utils
     glib
     gtk3
     gtk4
     libnotify
     wl-clipboard
     wlr-randr
     wayland
     wayland-scanner
     wayland-utils
     egl-wayland
     wayland-protocols
     xwayland
     glfw-wayland
     networkmanagerapplet
     lxappearance
     pavucontrol
     cacert # for eduroam
     # hyprland # this is most likely very outdated! so dont use it
  ];

  fonts.fonts = with pkgs; [

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-han-sans
    liberation_ttf
    julia-mono
    jetbrains-mono
    (import ../../pkgs/lucide-icon-font {inherit stdenv fetchzip;})
    #lucide-icon-font
    font-awesome_5
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ user ];


  ## -----------------------------------------------------------------------
  ## SERVICES
  ## -----------------------------------------------------------------------

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };

  services.blueman.enable = true;

  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 233 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -A 10"; }
      { keys = [ 232 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -U 10"; }
    ];
  };

  ## -----------------------------------------------------------------------
  ## OTHER OPTIONS
  ## -----------------------------------------------------------------------

  hardware.opengl.enable = true;

  #xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  ## -----------------------------------------------------------------------
  ## nix
  ## -----------------------------------------------------------------------

  nix = {
    
    package = pkgs.nixFlakes;

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];  
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system.stateVersion = "22.11"; # Did you read the comment?

}
