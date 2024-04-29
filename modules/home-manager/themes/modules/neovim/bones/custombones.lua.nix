{ config, ... }:
let
  getCol = key: config.colorScheme.palette.${key};
  base00 = getCol "base00";
  base01 = getCol "base01";
  base02 = getCol "base02";
  base03 = getCol "base03";
  base04 = getCol "base04";
  base05 = getCol "base05";
  base06 = getCol "base06";
  base07 = getCol "base07";
  base08 = getCol "base08";
  base09 = getCol "base09";
  base0A = getCol "base0A";
  base0B = getCol "base0B";
  base0C = getCol "base0C";
  base0D = getCol "base0D";
  base0E = getCol "base0E";
  base0F = getCol "base0F";

  variant = config.colorScheme.variant;

in ''
  local colors_name = "custombones"
  vim.g.colors_name = colors_name -- Required when defining a colorscheme

  local lush = require "lush"
  local hsluv = lush.hsluv -- Human-friendly hsl
  local util = require "zenbones.util"

  local bg = vim.o.background

  -- Define a palette. Use `palette_extend` to fill unspecified colors
  -- Based on https://github.com/gruvbox-community/gruvbox#palette
  local palette

  palette = util.palette_extend({
    bg = hsluv "#${base00}",
    fg = hsluv "#${base05}",
    rose = hsluv "#${base08}",
    leaf = hsluv "#${base0B}",
    wood = hsluv "#${base09}",
    water = hsluv "#${base0C}",
    blossom = hsluv "#${base0D}",
    sky = hsluv "#${base0C}",
  }, bg)

  -- Generate the lush specs using the generator util
  local generator = require "zenbones.specs"
  local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

  local accents = {
    palette.bg
  }

  local randomIndex = math.random(1, #accents)
  local randomElement = accents[randomIndex]

  -- Optionally extend specs using Lush
  local specs = lush.extends({ base_specs }).with(function()
  	return {
  		Statement { base_specs.Statement, fg = palette.rose },
  		Special { fg = palette.water },
  		Type { fg = palette.sky, gui = "italic" },
      ${
        if config.colorScheme.variant == "light" then
          "Statusline { bg = randomElement.darken(4), fg = palette.fg }"
        else
          "Statusline { bg = randomElement.lighten(4), fg = palette.fg }"
      },
  	}
  end)

  -- Pass the specs to lush to apply
  lush(specs)


  -- zenbones options
  -- https://github.com/mcchrish/zenbones.nvim/blob/main/doc/zenbones.md
  -- doesnt work currently, probably because its not available as a
  -- proper colorscheme
  vim.g.custombones_lightness = 'bright' 


  -- Optionally set term colors
  require("zenbones.term").apply_colors(palette)

''
