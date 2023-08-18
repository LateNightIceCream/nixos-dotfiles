{
  description = "its my system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:/Misterio77/nix-colors";
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }: 
  let

    user = "zamza";

    system = "x86_64-linux";

    myOverlay = import ./pkgs;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        myOverlay
      ];
    };

  in
  {
    overlays.default = myOverlay;
    nixosConfigurations = import ./hosts { inherit system nixpkgs pkgs inputs user; };
  };
}
