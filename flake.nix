{
  description = "its my system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:/Misterio77/nix-colors";
  };

  outputs = inputs @ { nixpkgs, home-manager, self, ... }: 
  let

    user = "zamza";

    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        self.overlays.default
      ];
    };

  in
  {
    overlays.default = (import ./pkgs).overlay;
    nixosConfigurations = import ./hosts { inherit system self nixpkgs pkgs inputs user; };
  };
}
