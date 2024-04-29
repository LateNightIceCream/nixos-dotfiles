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
  base10 = getCol "base0A";
  base11 = getCol "base0B";
  base12 = getCol "base0C";
  base13 = getCol "base0D";
  base14 = getCol "base0E";
  base15 = getCol "base0F";
in
''
require('base16-colorscheme').setup({
  base00 = '#${base00}', base01 = '#${base01}', base02 = '#${base02}', base03 = '#${base03}',
  base04 = '#${base04}', base05 = '#${base05}', base06 = '#${base06}', base07 = '#${base07}',
  base08 = '#${base08}', base09 = '#${base09}', base0A = '#${base10}', base0B = '#${base11}',
  base0C = '#${base12}', base0D = '#${base13}', base0E = '#${base14}', base0F = '#${base15}'
})
''
