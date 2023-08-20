{ stdenv, fetchzip }:

let
  pkgs = import <nixpkgs> { };
  lucideVersion = "v0.268.0"; # i think the "v" is wrong
in
stdenv.mkDerivation {
  pname = "lucide-icon-font";
  version = lucideVersion;

  src = fetchzip {
    url = "https://github.com/lucide-icons/lucide/releases/download/${lucideVersion}/lucide-font-${lucideVersion}.zip";
    sha256 = "sha256-kcgTojx/Qfw192kxWu+zWFr8YjSs3UCwPfT3j/Udw3A=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype/
    mv *.ttf $out/share/fonts/truetype/

    runHook postInstall
  '';
}
