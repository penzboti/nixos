{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [inputs.spicetify-nix.nixosModules.default];

  programs.spicetify = {
    enable = true;
    spicetifyPackage = inputs.nixpkgs.legacyPackages."${pkgs.system}".spicetify-cli;
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
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
  };
}
