{ config, pkgs, inputs, user, ... }:

{

	home.username = "${user}";
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "22.11";


        ## -----------------------------------------------------------------------
	## USER PACKAGES
        ## -----------------------------------------------------------------------

	home.packages = with pkgs; [
		gnome.nautilus	
		python311
	];


        ## -----------------------------------------------------------------------
	## HOME MANAGER OPTIONS
        ## -----------------------------------------------------------------------

	programs.home-manager.enable = true;

	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		withPython3 = true;
	};

	imports = [
          (import ../../modules/editors/nvim)
	];


        ## -----------------------------------------------------------------------
	## SERVICES
        ## -----------------------------------------------------------------------

}
