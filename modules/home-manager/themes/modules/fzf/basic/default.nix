{ lib, config, home, ... }:

let
  cfg = config.programs.fzf.myopts.theme.basic;
  enable = cfg.enable && config.programs.fzf.enable;
in {

  options.programs.fzf.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable fzf basic theme";
  };

  config = lib.mkIf enable {

    programs.fzf.colors = {

      bg = "#${config.colorScheme.colors.base00}";
      "bg+" = "#${config.colorScheme.colors.base0D}"; # background current line
      fg = "#${config.colorScheme.colors.base05}";
      "fg+" = "#${config.colorScheme.colors.base00}"; # foreground current line
      preview-fg =
        "#${config.colorScheme.colors.base05}"; # e.g. nvim :Files / :Rg => foreground
      preview-bg =
        "#${config.colorScheme.colors.base01}"; # e.g. nvim :Files / :Rg => background
      hl = "#${config.colorScheme.colors.base0A}";
      "hl+" = "#${config.colorScheme.colors.base0E}";
      info = "#${config.colorScheme.colors.base0D}";
      pointer = "#${config.colorScheme.colors.base00}";
      border = "#${config.colorScheme.colors.base03}";
      prompt = "#${config.colorScheme.colors.base0D}";

    };
  };

}
