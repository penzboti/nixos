{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../bundles/essentials.nix
    ../../bundles/desktop.nix # lol doesn't work well on a virtual machine
    # note: doesn't autostart without a display manager

    ../../modules/cli-tools.nix
    ../../modules/cli-extra.nix
    ../../modules/helix.nix
    ../../modules/browsers.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  system.stateVersion = "25.05";
}
