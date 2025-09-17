{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/cli-tools.nix
    ../modules/cli-extra.nix
    ../modules/helix.nix
  ];
}
