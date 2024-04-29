{ config, pkgs, ... }:

rec {

  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/hdd-1/music/"; # "~/Music/";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My Pipewire Output"
      }
    '';
  };

  services.mpdris2 = {
    enable = true;
    multimediaKeys = true;
    notifications = true;
    #mpd.musicDirectory = "~/Music/";
  };

}

