# https://github.com/Gerg-L/spicetify-nix
{ pkgs, spicetify-nix, ... }:
let
   spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [ spicetify-nix.nixosModules.default ];

  programs.spicetify = {
    enable = true;
    # spicetifyPackage = inputs.nixpkgs.legacyPackages."${pkgs.system}".spicetify-cli;
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
