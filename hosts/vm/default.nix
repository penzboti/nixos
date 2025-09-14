{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../bundles/essentials.nix

    ../../modules/cli-extra.nix
    ../../modules/helix.nix
  ];
}
