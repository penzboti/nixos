{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libnotify # custom notifiactions
    presenterm # markdown presentations (in the terminal?)
    portal # send files across devices
    chafa # image viewer (but in the terminal)
    eza # better ls
    bat # cat with syntax highlighting
    wget # needed for sg idk
    nushell
    discordo # terminal discord client
    pom # pomodoro timer
    yt-dlp # download youtube videos
    mpv # why not
    youtube-tui # why not
    # wiki-tui # if you need it, -p it
    # zellij # instead of tmux, but i never used either of them yet
    # ondedrive or onedriver ### side note: google drive doesn't really have a good option
  ];
}
