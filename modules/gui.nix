{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    qimgv # media viewer
    # vlc # might not need it bc of qimgv
    swaynotificationcenter
    thunar # file manager
    gnome-tweaks # set thunar theme and mouse cursor theme
    webcamoid # camera app
    ghostty # terminal emulator
    qalculate-gtk # calculator app
  ];

  # set default applications
  xdg = {
    terminal-exec = {
      enable = true;
      settings.default = ["ghostty.desktop"];
    };
    mime = {
      defaultApplications = {
        "inode/directory" = "dolphin.desktop";
      };
      addedAssociations = {
        "inode/directory" = "dolphin.desktop";
      };     
    };
  };
}
