Put a folder for the colorscheme and the scheme file (following `nix-colors` style) in here. 

Then, put a default.nix in the folder which defines the theme variants in an attrs and imports those.

Then it should be available as `config.theme.colors.<folder-name>.variant`, e.g. `config.theme.colors.rosepine.dawn`.
