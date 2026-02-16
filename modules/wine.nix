{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wine-wayland
    # the app is installed, but can't try if it fully works since i dont have .exe files
  ];
}
