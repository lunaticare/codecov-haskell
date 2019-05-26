{ ghc }:
let pkgs = (import (fetchTarball {
        url = https://github.com/NixOS/nixpkgs-channels/archive/a7e559a5504572008567383c3dc8e142fa7a8633.tar.gz;
        sha256 = "16j95q58kkc69lfgpjkj76gw5sx8rcxwi3civm0mlfaxxyw9gzp6";
    }) {});

in pkgs.haskell.lib.buildStackProject {
  inherit ghc;
  name = "myEnv";
  buildInputs = [ 
      pkgs.curl
      pkgs.zlib
      ];
}
