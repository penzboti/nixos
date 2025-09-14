{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libnotify # custom notifiactions
    presenterm #!! untested
    portal # send files across devices
    chafa # image viewer (but in the terminal)
    eza # better ls
    bat # cat with syntax highlighting
    wget # needed for sg idk
    # ondedrive
    # onedriver
    # ### google drive doesn't really have a good option
  ];
}
