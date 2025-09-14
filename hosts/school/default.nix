{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/spicetify.nix
    ../../bundles/essentials.nix
    ../../bundles/desktop.nix
  ];
}
