{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;
}
