{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/hyprland.nix
    ../modules/gui.nix
  ];
}
