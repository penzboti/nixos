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
  ];

  # boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # trackpad
  hardware.trackpoint.emulateWheel = true;
  services.libinput.mouse.accelSpeed = "0.0";
  # services.libinput.mouse.disableWhileTyping = true; # have a script for disabling touchpad
  services.libinput.touchpad.sendEventsMode = "disabled-on-external-mouse";

  environment = {
    shellAliases = {
      shut = "shutdown -h now";
      space = "df -h | grep -E 'nvme0n1p1|Filesystem|/dev/disk/by-uuid/'";
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#school"; 
    };
  };
}
