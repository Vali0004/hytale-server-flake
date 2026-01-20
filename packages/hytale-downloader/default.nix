{
  outputs,
  stdenv,
  fetchzip,
  ...
}: let
  inherit (outputs.lib.getHytaleCDNSystem stdenv.hostPlatform) arch os;
in
  stdenv.mkDerivation {
    pname = "hytale-downloader";
    version = "2026.01.09-49e5904";

    meta = {
      mainProgram = "hytale-downloader";
    };

    src = fetchzip {
      url = "https://downloader.hytale.com/hytale-downloader.zip";
      hash = "sha256-I6912E6tIk41WGjH0uvZkQA1FbLdLYDxyKCoRFY5m1I=";
      stripRoot = false;
    };

    installPhase = ''
      mkdir -p $out/bin
      install -m755 $src/hytale-downloader-${os}-${arch} $out/bin/hytale-downloader
    '';
  }
