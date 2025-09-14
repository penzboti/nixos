{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    qimgv # media viewer
    swaynotificationcenter
    xfce.thunar # file manager
    gnome-tweaks # set thunar theme and mouse cursor theme
    webcamoid # camera app
    ghostty
    kitty # needed for hyprland
  ];
  # thunar, rofi, bluetooth, audio,
  programs = {
    hyprland.enable = true;
  }
}
