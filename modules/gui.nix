{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    qimgv # media viewer
    vlc # better video experience than qimgv
    swaynotificationcenter
    thunar # file manager
    webcamoid # camera app
    ghostty # terminal emulator
    qalculate-gtk # calculator app
    resonance # music player
    lunatask # good task app
    # no clock app / alarm app
  ];

  # set default applications
  xdg = {
    terminal-exec = {
      enable = true;
      settings.default = ["ghostty.desktop"];
    };
    mime = let
      image = "qimgv.desktop";
      video = "vlc.desktop";
      filemanager = "thunar.desktop";
    in {
      enable = true;
      defaultApplications = {
        "inode/directory" = filemanager;
        "image/*" = image;
        "video/*" = video;
      };
      addedAssociations = {
        "inode/directory" = filemanager;
        "image/*" = image;
        "video/*" = video;
      };     
    };
  };
}
