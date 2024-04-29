{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.programs.bash.myopts.theme.basic;
  enable = config.programs.bash.enable && cfg.enable;
  promptSymbol = cfg.promptSymbol;

  hex2rgb = hexstr: inputs.nix-colors.lib.conversions.hexToRGBString ";" hexstr;

  hex2escape = hexstr: typecode: "\\033[${typecode};2;${hex2rgb hexstr}m";

  hex2fg = hexstr: hex2escape hexstr "38";
  hex2bg = hexstr: hex2escape hexstr "48";

  term_bg = config.colorScheme.palette.base00;
  bg00 = config.colorScheme.palette.base02;
  fg00 = config.colorScheme.palette.base04;
  bg10 = config.colorScheme.palette.base02;
  fg10 = config.colorScheme.palette.base04;

  reset = "\\[\\e[0m\\]";

  bgsh00 = hex2bg bg00;
  fgsh00 = hex2fg fg00;
  bgsh10 = hex2bg bg10;
  fgsh10 = hex2fg fg10;

  col_text = col_bg: col_fg: text:
    "${hex2fg col_fg}${hex2bg col_bg}${text}${reset}";

  sep00 = col_text term_bg bg00 "";
  sep01 = col_text bg10 bg00 "";

  sep10 = col_text term_bg bg10 "";

in {

  options.programs.bash.myopts.theme.basic = {
    enable = lib.mkEnableOption "enable bash basic theme";

    promptSymbol = lib.mkOption {
      description = "The symbol at the start of the bash prompt.";
      example = "";
      type = lib.types.str;
      default = ">";
    };
  };

  config.programs.bash = lib.mkIf enable {

    bashrcExtra = builtins.readFile ./functions.sh + ''

      PROMPT_DIRTRIM=2

      #PS1='${sep00}${bgsh00}${fgsh00} \[\e[1m\]\u@\h \A ${sep01}${bgsh10}${fgsh10} \[\e[1m\]\w $(_git_branch) ${reset}${sep10}\n${promptSymbol}  '
      PS1='${sep00}${bgsh00}${fgsh00} \[\e[1m\]\A ${sep01}${bgsh10}${fgsh10} \[\e[1m\]\w $(_git_branch) ${reset}${sep10}\n${promptSymbol}  '
    '';
  };
}
