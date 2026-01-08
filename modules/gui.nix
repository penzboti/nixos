{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    qimgv # media viewer
    # vlc # might not need it bc of qimgv
    swaynotificationcenter
    xfce.thunar # file manager
    gnome-tweaks # set thunar theme and mouse cursor theme
    webcamoid # camera app
    ghostty # terminal emulator
    qalculate-gtk # calculator app
  ];
}
