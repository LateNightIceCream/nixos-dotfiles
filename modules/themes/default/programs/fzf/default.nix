{config, home, ...}:

{

  programs.fzf.colors = {

    bg = "#${config.colorScheme.colors.base01}";
    "bg+" = "#${config.colorScheme.colors.base0A}"; # background current line
    fg = "#${config.colorScheme.colors.base05}";
    "fg+" = "#${config.colorScheme.colors.base00}"; # foreground current line
    preview-fg = "#ff00ff";
    preview-bg = "#0000ff";
    hl = "#${config.colorScheme.colors.base09}";
    info = "#${config.colorScheme.colors.base09}";
    pointer = "#${config.colorScheme.colors.base01}";

  };

}
