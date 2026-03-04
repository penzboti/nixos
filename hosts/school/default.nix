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

    # ../../modules/spicetify.nix # got spotify premium, unneeded currently
    ../../modules/games.nix
    ../../modules/communication.nix
    ../../modules/spotify.nix
    ../../modules/class.nix
    ../../modules/flatpak.nix
    # ../../modules/wine.nix
    ../../modules/gamedev.nix
  ];

  # boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
    # HandlePowerKeyLongPress = "poweroff"; # handled by the HW, this is never achieved
    # HandleLidSwitch = "ignore";
  };

  environment = {
    shellAliases = {
      shut = "shutdown -h now";
      space = "df -h | grep -E 'nvme0n1p1|Filesystem|/dev/disk/by-uuid/'";
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#school"; 
    };
  };

  system.stateVersion = "24.05"; # DO NOT CHANGE IN ANY CIRCUMSTANCE
}
