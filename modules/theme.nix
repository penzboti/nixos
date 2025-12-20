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
    oh-my-posh # for bash, needed
    # oh-my-fish # for fish, not needed
  ];
}
