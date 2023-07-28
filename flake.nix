{
  description = "its my system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { nixpkgs, home-manager, flake-parts, ... }: 
  let

    user = "zamza";

    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in
  {
    nixosConfigurations = import ./hosts { inherit system nixpkgs inputs user; };
  };
}
