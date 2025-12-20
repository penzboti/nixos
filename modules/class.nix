{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inkscape
    gimp
    # libreoffice-qt6-fresh

    # c# devenv I CANT DEAL WITH
    # just write python code ig
  ];

  # might be close to xampp
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
