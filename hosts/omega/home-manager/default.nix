{ config, pkgs, inputs, outputs, user, nix-colors, ... }:

{

	home.username = "${user}";
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "23.05";


  ## -----------------------------------------------------------------------
	## USER PACKAGES
  ## -----------------------------------------------------------------------

	home.packages = with pkgs; [
    neofetch
    kitty
		gnome.nautilus	
    gnome.gnome-calendar
    inkscape
    logseq
    tdesktop # telegram
    yt-dlp
    mpv
    celluloid
    libsForQt5.qt5.qtwayland
    texlive.combined.scheme-full
    libreoffice
    unstable.godot_4
    nnn
    pamixer
    font-manager
    gnome.seahorse
    imagemagick
    image-roll
    keepassxc
    gscreenshot
    slurp
    grim
    ccls
    texlab
    gcc
    cmake
    inkscape
    gimp
    gnumake
    gnome.gnome-calculator
    cambalache
    obs-studio
    drawio
    poppler_utils
    nodejs_20
    webcamoid
    wl-clipboard
    kicad
    guitarix
    qjackctl
    jack2
    evolution
    tor-browser-bundle-bin
    ncmpcpp
    cmus
    picard
    audacity
    signal-desktop
    pinyin-tool
    poetry
    vmware-horizon-client
    nanotts
    mimic
    bootiso
    python310Packages.pygments
    swww
    zoom-us
    octaveFull
    freecad
    openscad
    bookworm
    julia
    melonDS
    #kdenlive # currently does not work :/
    pandoc
    just
    pympress
    meld
    git-cola
    cinny-desktop
    sshfs
    calibre
    zotero
    gnome.gnome-disk-utility
    pdftk
    g4music
    gnome-text-editor
    htop
    cava
    pipes
    cmatrix
    # unstable.zed-editor # maybe in the future .. currently its very very laggy and unresponsive
	];


  ## -----------------------------------------------------------------------
	## HOME MANAGER OPTIONS
  ## -----------------------------------------------------------------------

	programs.home-manager.enable = true;

  # the chosen theme
  lnicThemes.basicTheme.enable = true;
  colorScheme = config.lnicColorSchemes.rosepine.dawn;
  #programs.bash.basicTheme.promptSymbol = "";

 	imports = [
          nix-colors.homeManagerModules.default
          inputs.hyprland.homeManagerModules.default
          outputs.homeManagerModules.lnicThemes
          outputs.homeManagerModules.lnicColors
          (import ./modules/programs/editors/nvim)
          (import ./modules/programs/kitty)
          (import ./modules/programs/sioyek)
          (import ./modules/programs/mpd/home.nix)
          (import ./modules/programs/bash/home.nix)
          (import ./modules/programs/firefox)
          (import ./modules/programs/launcher/rofi)
          (import ./modules/programs/waybar)
          (import ./modules/desktop/hyprland)
  ];

  programs.firefox.enable = true;

  # Home Directories
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/Desktop";
      download = "$HOME/Downloads";
      documents = "$HOME/Documents";
      music = "$HOME/Music";
      videos = "$HOME/Videos";
      pictures = "$HOME/Pictures";
    };

  };

  # Keyboard
  i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-configtool
        fcitx5-with-addons
        fcitx5-chinese-addons
    ];
  };

  # this throws: 
  #   "The option `home-manager.users.zamza.xdg.portal' does not exist."
  # and i have no idea why
  #xdg.portal = {
  #};


  ## -----------------------------------------------------------------------
	## SERVICES
  ## -----------------------------------------------------------------------

  # Notifications
  services.dunst.enable = true;

  # Backups
  services.borgmatic = {
    enable = true;
    frequency = "hourly";
  };

  programs.borgmatic = {

    enable = true;

    backups = {
      personal = {

        location = {
          sourceDirectories = [
            "/home/${user}/Pictures/"
            "/home/${user}/Documents/"
            "/home/${user}/Sync/hs-logseq"
          ];
          repositories = [
            "/mnt/hdd-1/backups/omega/personal.borg"
          ];
        };

        retention = {
          keepDaily = 1;
          keepWeekly = 1;
          keepMonthly = 1;
        };

        consistency.checks = [
          {
            name = "repository";
            frequency = "2 weeks";
          }
          {
            name = "archives";
            frequency = "2 weeks";
          }
          {
            name = "data";
            frequency = "2 weeks";
          }
        ];
      };
    };
  };

}
