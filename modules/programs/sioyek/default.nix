{ config, pkgs, ... }:

{

  programs = {

    sioyek = {
      enable = true;
      config = {
        "enable_experimental_features" = "1";
        "use_heuristic_if_text_summary_not_available" = "1";
        "startup_commands" = "toggle_custom_color;";
        "should_launch_new_window" = "1";
      };
    };

  };

}
