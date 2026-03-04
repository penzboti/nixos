{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.wayland
    # this package prob works, it just takes ages to build
    # don't use it unless you want multiple hour bulid times
  ];
}
