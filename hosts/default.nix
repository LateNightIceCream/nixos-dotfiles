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
      {
        programs.hyprland.enable = true;
      }

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

	home-manager.extraSpecialArgs = { inherit inputs user; };
        home-manager.users.${user} = import ./omicron/home.nix;
      }

    ];

  };

}
