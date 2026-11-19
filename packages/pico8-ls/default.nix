{ lib
, stdenvNoCC
, fetchurl
, nodejs
, makeWrapper
}:

let
  version = "0.8.0";

  server = fetchurl {
    url = "https://github.com/japhib/pico8-ls/releases/download/v${version}/pico8-ls-server.js";
    hash = "sha256-BoMM7G5ZD4t173Jb4sdp2HbsBIMWQ31BVPrnh+0HtWk=";
  };
in
stdenvNoCC.mkDerivation {
  pname = "pico8-ls";
  inherit version;

  src = server;

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm644 $src $out/lib/pico8-ls/server.js

    makeWrapper ${nodejs}/bin/node $out/bin/pico8-ls \
      --add-flags "$out/lib/pico8-ls/server.js"

    runHook postInstall
  '';

  meta = {
    description = "PICO-8 Lua language server";
    homepage = "https://github.com/japhib/pico8-ls";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    mainProgram = "pico8-ls";
  };
}
