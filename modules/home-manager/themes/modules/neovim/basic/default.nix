{ lib, config, pkgs, home, ... }:

let
  cfg = config.programs.neovim.myopts.theme.basic;
  enable = cfg.enable && config.programs.neovim.enable;
  themePlugin = pkgs.callPackage ./plugin.nix { inherit config; };
in {

  # this module will generate a .lua file with the theme
  # configuration that you can then include in the neovim lua
  # config
  options.programs.neovim.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable neovim basic theme";
    outputPath = lib.mkOption {
      description =
        ".lua file output path relative to the user home directory.";
      type = lib.types.str;
      default = ".config/nvim/lua/colortheme.lua";
    };
  };

  config = lib.mkIf enable {
    home.file.${cfg.outputPath}.text =
      (import ./colortheme.lua.nix) { inherit config; };

    programs.neovim.plugins = [ pkgs.vimPlugins.nvim-base16 ];

  };

}
