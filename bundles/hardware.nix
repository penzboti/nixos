{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/audio.nix
    ../modules/bluetooth.nix
  ];

  environment.systemPackages = with pkgs; [
    udiskie # automount external storage devices TODO: need hyprland start
   ];
}
