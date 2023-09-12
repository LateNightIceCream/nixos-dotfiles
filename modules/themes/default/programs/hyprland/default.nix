{config, home, pkgs, ...}:

{
  home.file.".config/hypr/style.conf".text = import ./config/style.conf.nix { inherit config; };
}
