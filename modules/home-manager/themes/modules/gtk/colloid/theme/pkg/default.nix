{ pkgs, colorScheme }:
let

  white = if colorScheme.kind == "light" then
    "#${colorScheme.colors.base00}"
  else
    "#${colorScheme.colors.base05}";

  black = if colorScheme.kind == "light" then
    "#${colorScheme.colors.base05}"
  else
    "#${colorScheme.colors.base00}";

 my-color-file = ''
    // Custom Theme Color Palette

    // Red
    \$red-light: #${colorScheme.colors.base0A};
    \$red-dark: #${colorScheme.colors.base08};

    // Pink
    \$pink-light: #${colorScheme.colors.base0A};
    \$pink-dark: #${colorScheme.colors.base08};

    // Purple
    \$purple-light: #${colorScheme.colors.base0D};
    \$purple-dark: #${colorScheme.colors.base08};

    // Blue
    \$blue-light: #${colorScheme.colors.base0C};
    \$blue-dark: #${colorScheme.colors.base0B};

    // Teal
    \$teal-light: #${colorScheme.colors.base0C};
    \$teal-dark: #${colorScheme.colors.base0B};

    // Green
    \$green-light: #${colorScheme.colors.base0C};
    \$green-dark: #${colorScheme.colors.base0B};

    // Yellow
    \$yellow-light: #${colorScheme.colors.base09};
    \$yellow-dark: #${colorScheme.colors.base0A};

    // Orange
    \$orange-light: #${colorScheme.colors.base09};
    \$orange-dark: #${colorScheme.colors.base0A};

    // Grey
    \$grey-050: #${colorScheme.colors.base00};
    \$grey-100: #${colorScheme.colors.base00};
    \$grey-150: #${colorScheme.colors.base01};
    \$grey-200: #${colorScheme.colors.base01};
    \$grey-250: #ff00ff;
    \$grey-300: #${colorScheme.colors.base0A};
    \$grey-350: #ff0000;
    \$grey-400: #ffff00;
    \$grey-450: #0000ff;
    \$grey-500: #${colorScheme.colors.base0A};
    \$grey-550: #00ffff;
    \$grey-600: #00ff00;
    \$grey-650: #${colorScheme.colors.base0F};
    \$grey-700: #${colorScheme.colors.base02};
    \$grey-750: #${colorScheme.colors.base01};
    \$grey-800: #${colorScheme.colors.base04};
    \$grey-850: #${colorScheme.colors.base04};
    \$grey-900: #${colorScheme.colors.base05};
    \$grey-950: #${colorScheme.colors.base05};

    // White
    // \$white: #${colorScheme.colors.base00};
    \$white: ${white};

    // Black
    // \$black: #${colorScheme.colors.base05};
    \$black: ${black};

    // Button
    \$button-close: #${colorScheme.colors.base0A};
    \$button-max: #${colorScheme.colors.base0C};
    \$button-min: #${colorScheme.colors.base09};

    \$links: #${colorScheme.colors.base0C};

    // Theme
    \$default-light: \$blue-light;
    \$default-dark: \$blue-dark;
    '';
in
pkgs.colloid-gtk-theme.overrideAttrs {

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

}
