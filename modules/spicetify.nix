# https://github.com/Gerg-L/spicetify-nix
{ pkgs, inputs, ... }:
let
   spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [inputs.spicetify-nix.nixosModules.default];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      history
      beautifulLyrics
      oldSidebar
      webnowplaying
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "";
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
  };
}
