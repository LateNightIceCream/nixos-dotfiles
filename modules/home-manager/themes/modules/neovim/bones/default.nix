{ lib, config, pkgs, home, ... }:

let
  cfg = config.programs.neovim.myopts.theme.bones;
  enable = cfg.enable && config.programs.neovim.enable;
in {

  # this module will generate a .lua file with the theme
  # configuration that you can then include in the neovim lua
  # config
  options.programs.neovim.myopts.theme.bones = {
    enable = lib.mkEnableOption "enable neovim custombones theme";
    outputPath = lib.mkOption {
      description =
        ".lua file output path relative to the user home directory.";
      type = lib.types.str;
      default = ".config/nvim/lua/colortheme.lua";
    };
  };

  config = lib.mkIf enable {
    home.file.${cfg.outputPath}.text = ''
      vim.o.background = "${config.colorScheme.variant}" -- "light" or "dark"
    '' + ((import ./custombones.lua.nix) { inherit config; });
    #+ builtins.readFile ./lualine.lua;

    programs.neovim.plugins = [ pkgs.vimPlugins.zenbones-nvim ];

  };

}
