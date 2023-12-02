{ system, self, nixpkgs, pkgs, pkgs-unstable, inputs, user, ... }:

let
  # colors = import ../modules/themes/default/colors.nix;
  nix-colors = inputs.nix-colors;
in
{

  omicron = nixpkgs.lib.nixosSystem {

    inherit system;
    specialArgs = { inherit inputs user; };

    modules = [

      ./omicron/configuration.nix

      inputs.hyprland.nixosModules.default

      ../modules/desktop/hyprland

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {

          useGlobalPkgs = true;
          useUserPackages = true;

          extraSpecialArgs = { inherit inputs user nix-colors; };
          users.${user} = import ./omicron/home.nix;

        };
      }

    ];

  };


  omega = nixpkgs.lib.nixosSystem {

    inherit system;
    specialArgs = { inherit inputs user; };

    modules = [

      ./omega/configuration.nix

      inputs.hyprland.nixosModules.default

      ../modules/desktop/hyprland-nvidia

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {

          useGlobalPkgs = true;
          useUserPackages = true;

          extraSpecialArgs = { inherit inputs user nix-colors pkgs-unstable; };
          users.${user} = import ./omega/home.nix;

        };

        nixpkgs.overlays = [ 
          self.overlays.default 
        ] ++ (import ../overlays) { inherit pkgs; importColors = import ../modules/themes/default/colorscheme.nix; };

      }

    ];

  };

}
