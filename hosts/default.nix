{ system, self, nixpkgs, pkgs, inputs, outputs, ... }:

let nix-colors = inputs.nix-colors;
in {

  omega = let user = "zamza";
  in nixpkgs.lib.nixosSystem {

    inherit system;
    specialArgs = { inherit inputs outputs user; };

    modules = [

      ./omega/nixos/configuration.nix

      # remove this when home....xdg.portal actually works (currently, option cannot be found)
      ./omega/nixos/modules/hyprland

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {

          # copy pkgs as well as all overlays from the global pkgs
          useGlobalPkgs = true;

          useUserPackages = true;

          extraSpecialArgs = {
            inherit inputs outputs user nix-colors;

            # make our lib available in home-manager's lib
            # this might not be the best solution but it works for now
            lib = pkgs.lib.extend (final: prev:
              inputs.home-manager.lib
              // import ../lib { lib = prev // inputs.home-manager.lib; inherit inputs; });

          };
          users.${user} = import ./omega/home-manager;

        };

      }

    ];

  };

  #omicron = nixpkgs.lib.nixosSystem {
  #  inherit system;
  #  specialArgs = { inherit inputs user; };
  #};

}
