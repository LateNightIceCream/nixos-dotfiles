{ config, pkgs, inputs, user, ... }:

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
	];


  gtk = { # TODO: put this into separate module, perhaps to theme
    enable = true;
    theme = {
      name = "colloid-gtk";
      package = pkgs.colloid-gtk-theme;
    };
  };


  ## -----------------------------------------------------------------------
	## HOME MANAGER OPTIONS
  ## -----------------------------------------------------------------------

	programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;

 	imports = [
          (import ../../modules/editors/nvim)
          (import ../../modules/desktop/hyprland/home.nix)
          (import ../../modules/programs/kitty)
          (import ../../modules/programs/alacritty)
          inputs.hyprland.homeManagerModules.default
  ];


  ## -----------------------------------------------------------------------
	## SERVICES
  ## -----------------------------------------------------------------------

}
