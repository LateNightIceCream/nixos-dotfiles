{ config, pkgs, ... }:

{

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;

  home.shellAliases = {
    rm = "safe-rm";
    mv = "mv -i";
  };

  home.packages = with pkgs; [ safe-rm ];
}

