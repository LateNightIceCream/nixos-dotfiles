# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  lucide-icon-font = pkgs.callPackage ./lucide-icon-font { };
  secureai-tools = pkgs.callPackage ./secureai-tools { };
}
