{ home, config, inputs, ...}:

let

  hex2rgb = hexstr: inputs.nix-colors.lib.conversions.hexToRGBString ";" hexstr;

  hex2escape = hexstr: typecode: "\\033[${typecode};2;${hex2rgb hexstr}m";

  hex2fg = hexstr: hex2escape hexstr "38";
  hex2bg = hexstr: hex2escape hexstr "48";

  term_bg = config.colorScheme.colors.base00;
  bg00 = config.colorScheme.colors.base04;
  fg00 = config.colorScheme.colors.base00;
  bg10 = config.colorScheme.colors.base04;
  fg10 = config.colorScheme.colors.base00;

  reset = "\\[\\e[0m\\]";

  bgsh00 = hex2bg bg00;
  fgsh00 = hex2fg fg00;
  bgsh10 = hex2bg bg10;
  fgsh10 = hex2fg fg10;

  col_text = col_bg: col_fg: text: "${hex2fg col_fg}${hex2bg col_bg}${text}${reset}";

  sep00 = col_text term_bg bg00 "";
  sep01 = col_text bg10 bg00 "";

  sep10 = col_text term_bg bg10 "";

  #prompt_symbol = ""; # perhaps lucide icon
  prompt_symbol = ""; # perhaps lucide icon

in
{
  programs.bash = { 

    bashrcExtra = builtins.readFile ./functions.sh + ''

    PROMPT_DIRTRIM=2

    PS1='${sep00}${bgsh00}${fgsh00} \[\e[1m\]\u@\h \A ${sep01}${bgsh10}${fgsh10} \[\e[1m\]\w $(_git_branch) ${reset}${sep10}\n${prompt_symbol}  '
    
    '';
  };
}
