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
    ../../modules/powermanagement.nix
  ];

  # boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment = {
    shellAliases = {
      shut = "shutdown -h now";
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#asusvivo"; 
      space = "df -h | grep -E '/dev/nvme0n1p2|Filesystem'";
    };
  };

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "ignore"; # handled by the HW, this is never achieved
    HandleLidSwitch = "suspend";
    # note: if sleep sucks, use hybernation https://nixos.wiki/wiki/Hibernation
  };

  system.stateVersion = "26.05"; # DO NOT CHANGE IN ANY CIRCUMSTANCE
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "asusvivo";
}
