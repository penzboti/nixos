{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # these apear in gnome tweaks; and have to apply them manually
    # TODO: apply them in config
    # NOTE: this file might be unnecessary with home-manager
    kanagawa-gtk-theme
    kanagawa-icon-theme
    bibata-cursors

    # theme installers
    oh-my-posh # for bash
    oh-my-fish # for fish (i think i can rule this out tho atp)
  ];
}
