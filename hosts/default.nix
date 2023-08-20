{system, nixpkgs, pkgs, inputs, user, ...}:

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

          extraSpecialArgs = { inherit inputs user nix-colors; };
          users.${user} = import ./omega/home.nix;

        };
      }

    ];

  };

}
