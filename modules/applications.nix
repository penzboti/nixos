{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    discord
    betterdiscordctl

    spotify # if spicetify is not needed

    obsidian
  ];
}
