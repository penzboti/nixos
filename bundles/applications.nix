{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ../modules/spicetify.nix
    # choose one ^/v
    ../modules/spotify.nix
    #---
    ../modules/office.nix
    ../modules/games.nix
    ../modules/gamedev.nix
    ../modules/video.nix
    ../modules/communication.nix
    ../modules/class.nix
    ../modules/android.nix
  ];

  # CURRENTLY uncategorised / unneeded apps
  # qbittorrent-enhanced
  # protonvpn-gui
}
