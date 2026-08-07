{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../bundles/essentials.nix
    ../../bundles/cli.nix
    ../../bundles/desktop.nix
    ../../bundles/hardware.nix
    ../../bundles/applications.nix

    ../../modules/flatpak.nix
    ../../modules/wine.nix
  ];

  # boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment = {
    shellAliases = {
      shut = "shutdown -h now";
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#asusvivo"; 
    };
  };

  system.stateVersion = "26.05"; # DO NOT CHANGE IN ANY CIRCUMSTANCE
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "asusvivo";
}
