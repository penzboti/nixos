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

    razergenie # razer peripherals companion app
    # note: needs the other razer app it seems like

    # qbittorrent-enhanced
    # protonvpn-gui
  ];
}
