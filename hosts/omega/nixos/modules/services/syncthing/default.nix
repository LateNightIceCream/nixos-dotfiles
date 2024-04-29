{ config, lib, pkgs, inputs, user, ... }:

{

  services.syncthing = {
    enable = true;
    user = "${user}";
    dataDir = "/home/${user}/Sync";
    settings = {

      devices = {
        "omega" = {
          id =
            "KXZOD7I-2PKQ2JC-KDOINQJ-W4LMEAI-3KSQXFV-ZOVN4Y6-FSME5M7-5LUDIAM";
        };
        "omicron" = {
          id =
            "PUDBCU5-OFTQH5Y-L62F7OZ-ZUA5PNR-IR3ZLLQ-MA3PLSQ-6IVRQLP-U2RGMQR";
        };
        "srv" = {
          id =
            "6JI5M2G-TLPJKBY-GA5M5PN-GA5TFKP-NMK5GOM-HJSKG6Y-5SOBXMQ-OQT5ZAM";
        };
      };

      folders = {
        "hs-logseq" = {
          path = "/home/${user}/Sync/hs-logseq";
          devices = [ "omega" "srv" "omicron" ];
        };
      };

    };
  };

}
