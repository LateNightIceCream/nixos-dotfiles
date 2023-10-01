{ config, pkgs, inputs, user, nix-colors, ... }:

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
    firefox
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
    #vmware-horizon-client
    libsForQt5.qt5.qtwayland
    texlive.combined.scheme-full
    zathura
    libreoffice
    godot_4
    joshuto
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
    rustup
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
	];


  ## -----------------------------------------------------------------------
	## HOME MANAGER OPTIONS
  ## -----------------------------------------------------------------------

	programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;

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
          #(import ../../modules/programs/spotify)
          inputs.hyprland.homeManagerModules.default
          (import ../../modules/themes/default)
  ];





  # programs // (import ../../modules/themes/default { inherit programs; });


  ## -----------------------------------------------------------------------
	## SERVICES
  ## -----------------------------------------------------------------------

  services.mako.enable = true;

}
