# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, user, outputs, ... }:

{

  nixpkgs = {

    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "electron-25.9.0" "nix-2.15.3" ];
    };

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
  };

  ## -----------------------------------------------------------------------
  ## HARDWARE
  ## -----------------------------------------------------------------------

  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/services/syncthing
  ];

  boot.kernelParams = [ "intel_iommu=on" ];

  hardware.bluetooth.enable = true;

  fileSystems."/mnt/hdd-1" = {
    device = "/dev/disk/by-uuid/9894bac3-2c90-4e27-9595-81c2e87913c8";
    fsType = "ext4";
  };

  #systemd.tmpfiles.rules = [
  #  "d /mnt/hdd-1/backups/omega/personal 0764 ${user} wheel"
  #];

  ## -----------------------------------------------------------------------
  ## BOOTLOADER
  ## -----------------------------------------------------------------------

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.tmp.cleanOnBoot = true;

  ## -----------------------------------------------------------------------
  ## NETWORKING
  ## -----------------------------------------------------------------------

  # Define your hostname.
  networking.hostName = "omega";

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
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
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
    extraGroups =
      [ "networkmanager" "wheel" "audio" "video" "dialout" "docker" ];
  };

  ## -----------------------------------------------------------------------
  ## PACKAGES
  ## -----------------------------------------------------------------------

  environment.systemPackages = with pkgs; [

    vim
    wget
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
    killall
    ncurses5
    flex
    bison
    scons
    skopeo
    lshw
    openssl
    #unstable.libnvidia-container
    #unstable.nvidia-docker
    #unstable.nvidia-container-toolkit
    docker-compose
    (blender.override { cudaSupport = true; })
  ];

  fonts.packages = with pkgs;
    [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-han-sans
      liberation_ttf
      julia-mono
      jetbrains-mono
      font-awesome_5
      nerdfonts
      mononoki
      cozette
    ] ++ [ lucide-icon-font ];

  programs.dconf.enable = true;
  programs.light.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ user ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.vmware.guest.enable = true;

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  #virtualisation.docker.rootless = {
  #  enable = true;
  #  setSocketVariable = true;
  #};

  # https://nix-community.github.io/home-manager/options.html#opt-programs.bash.enableCompletion
  environment.pathsToLink = [ "/share/bash-completion" ];

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
      jack.enable = true;
    };
  };

  services.blueman.enable = true;

  services.actkbd = {
    enable = true;
    bindings = [
      {
        keys = [ 233 ];
        events = [ "key" ];
        command = "/run/wrappers/bin/light -A 10";
      }
      {
        keys = [ 232 ];
        events = [ "key" ];
        command = "/run/wrappers/bin/light -U 10";
      }
    ];
  };

  services.gvfs.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.udev.packages = [ ];

  ## -----------------------------------------------------------------------
  ## OTHER OPTIONS
  ## -----------------------------------------------------------------------

  #nixpkgs.config.packageOverrides = pkgs: {
  #  vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  #};

  programs.git = { enable = true; };

  programs.git.prompt.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ vaapiIntel ];

  boot.extraModulePackages = with config.boot.kernelPackages;
    [
      v4l2loopback # for OBS Studio virtual camera
    ];

  services.xserver.videoDrivers = [ "nvidia" ]; # nope

  # testing, maybe need to remove later
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  #xdg.portal = {
  #  enable = true;
  #wlr.enable = true;
  #  extraPortals = [ 
  #pkgs.xdg-desktop-portal-wlr
  #    pkgs.xdg-desktop-portal-gtk
  #    ];
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  ## -----------------------------------------------------------------------
  ## tty colors
  ## -----------------------------------------------------------------------

  console.colors = [
    "232136"
    "2a273f"
    "393552"
    "6e6a86"
    "908caa"
    "e0def4"
    "e0def4"
    "56526e"
    "eb6f92"
    "f6c177"
    "ea9a97"
    "3e8fb0"
    "9ccfd8"
    "c4a7e7"
    "f6c177"
    "56526e"
  ];

  ## -----------------------------------------------------------------------
  ## nix
  ## -----------------------------------------------------------------------

  nix = {

    package = pkgs.nixFlakes;

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" user ];
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

  system.stateVersion = "23.05"; # Did you read the comment?

}
