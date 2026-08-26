{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt-stable
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;
}
