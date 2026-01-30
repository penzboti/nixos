{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    discord
    betterdiscordctl

    spotify # note: spicetify is a spotify client in the terminal

    whatsapp-electron

    obsidian

    # qbittorrent-enhanced
    # protonvpn-gui
  ];
}
