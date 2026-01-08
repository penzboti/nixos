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
    nushell
    discordo
    # wiki-tui # if you need it, -p it
    # zellij # instead of tmux, but i never used either of them yet
    # ondedrive or onedriver ### side note: google drive doesn't really have a good option
  ];
}
