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
	home.stateVersion = "22.11";


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
		python311
    #(python3.withPackages my-python-packages)
    #(python311.withPackages(ps: with ps; [ simpy ]))
    logseq
    tdesktop # telegram
    R
    R-with-my-packages
    yt-dlp
    mpv
    #vmware-horizon-client
    libsForQt5.qt5.qtwayland
    texlive.combined.scheme-full
    zathura
    libreoffice
    nnn
    pympress
    godot_4
    pamixer
    font-manager
	];


  gtk = { # TODO: put this into separate module, perhaps to theme
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
    iconTheme = {
      name = "Colloid-dark";
      package = colloid-icon-theme;
    };
  };


  ## -----------------------------------------------------------------------
	## HOME MANAGER OPTIONS
  ## -----------------------------------------------------------------------

	programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;

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
          (import ../../modules/desktop/hyprland/home.nix)
          (import ../../modules/programs/kitty)
          (import ../../modules/programs/alacritty)
          inputs.hyprland.homeManagerModules.default
          (import ../../modules/themes/default)
  ];

  # programs // (import ../../modules/themes/default { inherit programs; });


  ## -----------------------------------------------------------------------
	## SERVICES
  ## -----------------------------------------------------------------------

}
