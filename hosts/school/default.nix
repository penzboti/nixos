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
    ../../modules/theme.nix
    ../../modules/applications.nix
    ../../modules/class.nix
    # ../../modules/gamedev.nix
  ];

  # boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # trackpad
  # probably taken over entirely by hyprland
  hardware.trackpoint.emulateWheel = true;
  services.libinput.mouse.accelSpeed = "0.0";
  # services.libinput.mouse.disableWhileTyping = false; # this is def takeon over by hyprland
  services.libinput.touchpad.sendEventsMode = "disabled-on-external-mouse";
  # services.logind.lidSwitch = "ignore"; # ignore lid closing as an action

  environment = {
    shellAliases = {
      shut = "shutdown -h now";
      space = "df -h | grep -E 'nvme0n1p1|Filesystem|/dev/disk/by-uuid/'";
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#school"; 
    };
  };

  system.stateVersion = "24.05"; # DO NOT CHANGE IN ANY CIRCUMSTANCE
}
