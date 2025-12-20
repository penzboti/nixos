{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/spicetify.nix
    ../modules/applications.nix
    ../modules/office.nix
    ../modules/games.nix
    ../modules/gamedev.nix
    ../modules/video.nix
  ];
}
