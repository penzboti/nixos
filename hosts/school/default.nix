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

    ../../modules/spicetify.nix
    ../../modules/games.nix
    ../../modules/theme.nix
    ../../modules/applications.nix
    # ../../modules/gamedev.nix
  ];

  # boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # trackpad
  hardware.trackpoint.emulateWheel = true;
  services.libinput.mouse.accelSpeed = "0.0";
  services.libinput.mouse.disableWhileTyping = false; # i have a script for disabling touchpad; sadly, it still does it
  services.libinput.touchpad.sendEventsMode = "disabled-on-external-mouse";
  # services.logind.lidSwitch = "ignore"; # ignore lid closing as an action

  environment = {
    shellAliases = {
      shut = "shutdown -h now";
      space = "df -h | grep -E 'nvme0n1p1|Filesystem|/dev/disk/by-uuid/'";
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#school"; 
    };
  };
}
