{
  lib,
  username,
  ...
}: {

  # DEFAULT NIX

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

  # LOCALE

  time.timeZone = "Europe/Budapest";

  console.useXkbConfig = true; # use xkb.options in tty.
  services.xserver = {
    enable = true;
    xkb.layout = "hu";
  };

  # idk what this does
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu.UTF-8";
    LC_IDENTIFICATION = "hu.UTF-8";
    LC_MEASUREMENT = "hu.UTF-8";
    LC_MONETARY = "hu.UTF-8";
    LC_NAME = "hu.UTF-8";
    LC_NUMERIC = "hu.UTF-8";
    LC_PAPER = "hu.UTF-8";
    LC_TELEPHONE = "hu.UTF-8";
    LC_TIME = "hu.UTF-8";
  };
}
