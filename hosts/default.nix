{system, nixpkgs, inputs, user, ...}:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
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

          extraSpecialArgs = { inherit inputs user; };
          users.${user} = import ./omicron/home.nix;

        };
      }

    ];

  };

}
