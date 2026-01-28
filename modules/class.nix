{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inkscape # vector graphics
    gimp # pixel graphics
    xournalpp # drawing & note taking

    # libreoffice-qt6-fresh # ms office

    # c# devenv I CANT DEAL WITH
    # just write python code ig
  ];

  # might be close to xampp
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
