{ pkgs, importColors, ... }:
let

  lib = pkgs.lib;

  white = if importColors.kind == "light" then
    "${importColors.colors.base00}"
  else
    "${importColors.colors.base05}";

  black = if importColors.kind == "light" then
    "${importColors.colors.base05}"
  else
    "${importColors.colors.base00}";

 my-color-file = ''
    // Custom Theme Color Palette

    // Red
    \$red-light: ${importColors.colors.base0A};
    \$red-dark: ${importColors.colors.base08};

    // Pink
    \$pink-light: ${importColors.colors.base0A};
    \$pink-dark: ${importColors.colors.base08};

    // Purple
    \$purple-light: ${importColors.colors.base0D};
    \$purple-dark: ${importColors.colors.base08};

    // Blue
    \$blue-light: ${importColors.colors.base0C};
    \$blue-dark: ${importColors.colors.base0B};

    // Teal
    \$teal-light: ${importColors.colors.base0C};
    \$teal-dark: ${importColors.colors.base0B};

    // Green
    \$green-light: ${importColors.colors.base0C};
    \$green-dark: ${importColors.colors.base0B};

    // Yellow
    \$yellow-light: ${importColors.colors.base09};
    \$yellow-dark: ${importColors.colors.base0A};

    // Orange
    \$orange-light: ${importColors.colors.base09};
    \$orange-dark: ${importColors.colors.base0A};

    // Grey
    \$grey-050: ${importColors.colors.base00};
    \$grey-100: ${importColors.colors.base00};
    \$grey-150: ${importColors.colors.base01};
    \$grey-200: ${importColors.colors.base01};
    \$grey-250: #ff00ff;
    \$grey-300: ${importColors.colors.base0A};
    \$grey-350: #ff0000;
    \$grey-400: #ffff00;
    \$grey-450: #0000ff;
    \$grey-500: ${importColors.colors.base0A};
    \$grey-550: #00ffff;
    \$grey-600: #00ff00;
    \$grey-650: ${importColors.colors.base0F};
    \$grey-700: ${importColors.colors.base02};
    \$grey-750: ${importColors.colors.base01};
    \$grey-800: ${importColors.colors.base04};
    \$grey-850: ${importColors.colors.base04};
    \$grey-900: ${importColors.colors.base05};
    \$grey-950: ${importColors.colors.base05};

    // White
    // \$white: ${importColors.colors.base00};
    \$white: ${white};

    // Black
    // \$black: ${importColors.colors.base05};
    \$black: ${black};

    // Button
    \$button-close: ${importColors.colors.base0A};
    \$button-max: ${importColors.colors.base0C};
    \$button-min: ${importColors.colors.base09};

    \$links: ${importColors.colors.base0C};

    // Theme
    \$default-light: \$blue-light;
    \$default-dark: \$blue-dark;
    '';
in
[
  (final: prev: {
        colloid-custom = prev.colloid-gtk-theme.overrideAttrs {
            installPhase = ''
              runHook preInstall

              # override with my colors
              echo "${my-color-file}" > src/sass/_color-palette-default.scss

              # TODO: fix this later (options)
              name= HOME="$TMPDIR" ./install.sh \
                --name Colloid-Custom \
                --theme default \
                --color standard \
                --tweaks rimless \
                --dest $out/share/themes

              jdupes --quiet --link-soft --recurse $out/share

              runHook postInstall
            '';
        };
  })
]
