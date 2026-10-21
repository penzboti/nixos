{ pkgs, darling-lol, ... }:
{
  environment.systemPackages = [
    darling-lol.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  users.users.penzboti.autoSubUidGidRange = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
