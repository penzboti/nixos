{
  lib,
  username,
  pkgs,
  ...
}: {

  # NIXOS
  # later on, separate the options i wouldn't be able to use in macos or ubuntu
 
  programs.nix-ld.enable = true; # run precompiled binaries on nix

  users.users.${username}= {
    isNormalUser = true;
    home = "/home/${username}";
    description = username;
    # hoping it doesn't cry if it does not recognize groups (when we dont configure audio or video)
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };

  nix.settings = {
    trusted-users = [username];
    experimental-features = ["nix-command" "flakes"];
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  networking.networkmanager.enable = true;
  powerManagement.enable = true;

  programs.light.enable = true;
  services.upower.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts-cjk-sans
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontDir.enable = true;

  # LOCALE

  time.timeZone = "Europe/Budapest";

  console.useXkbConfig = true; # use xkb.options in tty
  # this now adds a (bad looking) display manager (gui login)
  # because this is x11
  # but its the easiest way to set the keyboard layout (according to the wiki)
  services.xserver = {
    enable = true;
    xkb.layout = "hu";
  };
  # disable all display managers by default
  systemd.services.display-manager.enable = lib.mkDefault false;

  i18n.defaultLocale = "en_GB.UTF-8";
  # idk what this does
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

}
