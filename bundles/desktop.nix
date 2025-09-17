{
  config,
  pkgs,
  ...
}: {
  # hyprland and the hypr ecosystem, and anything that a visual environment needs
  imports = [
    ../modules/hyprland.nix
    ../modules/gui.nix
    ../modules/browsers.nix
    ../modules/sddm.nix
  ];
}
