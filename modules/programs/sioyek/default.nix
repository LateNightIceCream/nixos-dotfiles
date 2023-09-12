{ config, pkgs, ... }:

{

  programs = {

    sioyek = {
      enable = true;
      config = {
        "text_highlight_color" = "1.0 0.0 1.0";
        "enable_experimental_features" = "1";
        "use_heuristic_if_text_summary_not_available" = "1";
      };
    };

  };

}
