{
  description = "its my system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:/Misterio77/nix-colors";
  };

  outputs = inputs @ { nixpkgs, nixpkgs-unstable, home-manager, self, ... }: 
  let

    user = "zamza";

    system = "x86_64-linux";

    overlay-unstable = final: prev: {
    };

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        self.overlays.default
      ];

    };

    pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };

  in
  {
    overlays.default = (import ./pkgs).overlay;
    nixosConfigurations = import ./hosts { inherit system self nixpkgs pkgs pkgs-unstable inputs user; };
  };
}
