{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    waydroid # android emulator
  ];
}
