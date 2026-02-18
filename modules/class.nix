{
  config,
  pkgs,
  ...
}: {
  # modules/office for libreoffice

  environment.systemPackages = with pkgs; [
    obsidian # note taking
    xournalpp # drawing & hand-written note taking

    # it class
    inkscape # vector graphics
    gimp # pixel graphics

    # c# devenv I CANT DEAL WITH
    # just write python code ig
  ];

  # mariadb server
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
