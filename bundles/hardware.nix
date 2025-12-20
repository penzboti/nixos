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
    udiskie # automount external storage devices
  ];

  services.udisks2.enable = true; # for udiskie
}
