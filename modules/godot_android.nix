{ config, pkgs, ... }:
# for godot 4.7.2
let
  androidSdk = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "36" ];
    buildToolsVersions = [ "36.1.0" ];

    includeNDK = true;
    ndkVersions = [ "29.0.14206865" ];

    includeCmake = true;
    cmakeVersions = [ "3.22.1" ];

    includeEmulator = false;
    includeSystemImages = false;
    includeSources = false;
  };
in
{
  environment.systemPackages = [
    pkgs.android-studio
    pkgs.android-tools
    androidSdk.androidsdk
    pkgs.jdk17
  ];
}
