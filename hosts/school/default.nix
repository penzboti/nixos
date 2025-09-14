{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/spicetify.nix
    ../../bundles/essentials.nix
    ../../bundles/desktop.nix
  ];

  # TODO: kinda forgot what this is for;
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.trackpoint.emulateWheel = true;
  services.libinput.mouse.accelSpeed = "0.0";
  services.libinput.mouse.disableWhileTyping = true;
  services.libinput.touchpad.sendEventsMode = "disabled-on-external-mouse";

  environment = {
    shellAliases = {
      space = "df -h | grep -E 'nvme0n1p1|Filesystem|/dev/disk/by-uuid/'";
    };
  };
}
