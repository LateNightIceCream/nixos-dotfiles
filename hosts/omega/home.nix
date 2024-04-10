{ config, pkgs, pkgs-unstable, inputs, user, nix-colors, ... }:

with pkgs;
let
  R-with-my-packages = rWrapper.override {
    packages = with rPackages; [
        ggplot2
      ];
    };

in
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
    alacritty
    librewolf
		gnome.nautilus	
    gnome.gnome-calendar
    inkscape
    logseq
    tdesktop # telegram
    R
    R-with-my-packages
    yt-dlp
    mpv
    celluloid
    libsForQt5.qt5.qtwayland
    texlive.combined.scheme-full
    libreoffice
    pkgs-unstable.godot_4
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
    cmatrix
    pipes
    cava
    ccls
    texlab
    gcc
    cmake
    #clang
    inkscape
    gimp
    gnumake
    gnome.gnome-calculator
    #rustup
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
    cura
    tor-browser-bundle-bin
    htop
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
    desmume
    melonDS
    pitivi
    #kdenlive # currently does not work :/
    pandoc
    just
    pympress
    meld
    git-cola
    pcsx2
    cinny-desktop
    fractal
    sshfs
    calibre
    zotero
    gnome.gnome-disk-utility
    pdftk
	];

  qt = {
    enable = true;
    platformTheme = "gtk3";
  };


  ## -----------------------------------------------------------------------
	## HOME MANAGER OPTIONS
  ## -----------------------------------------------------------------------

	programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;

  programs.firefox.enable = true;

  home.shellAliases = {
    ssh = "kitty + kitten ssh";
  };

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/Desktop";
      download = "$HOME/Downloads";
      documents = "$HOME/Documents";
      # templates = "$HOME/Templates";
      music = "$HOME/Music";
      videos = "$HOME/Videos";
      pictures = "$HOME/Pictures";
      # publicShare = "$HOME/share/public";
    };
  };

  colorScheme = import ../../modules/themes/default/colorscheme.nix;

 	imports = [
          nix-colors.homeManagerModules.default
          (import ../../modules/editors/nvim)
          (import ../../modules/desktop/hyprland-nvidia/home.nix)
          (import ../../modules/programs/kitty)
          (import ../../modules/programs/sioyek)
          (import ../../modules/programs/alacritty)
          (import ../../modules/programs/mpd/home.nix)
          (import ../../modules/programs/syncthing)
          #(import ../../modules/programs/spotify)
          inputs.hyprland.homeManagerModules.default
          (import ../../modules/themes/default)
  ];

  programs.borgmatic = {

    enable = true;

    backups = {
      personal = {

        location = {
          sourceDirectories = [
            "/home/${user}/Pictures/"
            "/home/${user}/Documents/"
            "/home/${user}/hs-logseq"
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

  # programs // (import ../../modules/themes/default { inherit programs; });

  i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        #fcitx5-mozc
        fcitx5-gtk
        fcitx5-configtool
        fcitx5-with-addons
        fcitx5-chinese-addons
    ];
    #enabled = "ibus";
    #ibus.engines = with pkgs.ibus-engines; [
    #  libpinyin
    #  rime
    #];
  };





  ## -----------------------------------------------------------------------
	## SERVICES
  ## -----------------------------------------------------------------------

  services.mako.enable = true;

  services.borgmatic = {
    enable = true;
    frequency = "hourly";
  };

}
