{ home, config, ...}:

# this is all not very idiomatic
# but hey, it works :) (kind of)
let
  col_sec_1 = "2";
  col_fg = "\$(tput setaf 0)";
  col_bg = "\$(tput setab ${col_sec_1})";
  col_fg_sym = "\$(tput setaf ${col_sec_1})";
  bold = "\\e[1m";
  dir = "\\w";
  reset = "\$(tput sgr0)";
  #git_branch = "\$(__git_ps1)";
  newline = "\n";
  prompt_symbol = "";
in
{
  programs.bash = { 
    # ps1 requires lucide icons
    # have to source git-prompt.sh manually for some reason
    # https://github.com/NixOS/nixpkgs/issues/199046 
    bashrcExtra = builtins.readFile ./functions.sh + ''
    source /run/current-system/sw/share/bash-completion/completions/git-prompt.sh

    #COL_1="$(get_rand_col)"
    PROMPT_DIRTRIM=2
    
    PS1='${col_fg_sym}${reset}${col_bg}${col_fg}${bold} \u@\H \A ${reset}${col_fg_sym}${reset} ${dir} ${reset}$(_git_branch)${newline}${bold}${prompt_symbol} '
    trap 'echo -ne "${reset}"' DEBUG
    '' + builtins.readFile ./bashrcExtra.sh;
  };
}
