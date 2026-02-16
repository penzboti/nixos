{
  config,
  pkgs,
  nix-flatpak,
  ...
}: {
  imports = [
    "${nix-flatpak}/modules/nixos.nix"
  ];

  # installs during an activation phase: makes that phase take long
  # if it doesn't install, remove the package (from config), rebuild, then readd, then rebuild
  # automatically adds flathub as a remote

  services.flatpak = {
    enable = true;
    packages = [];
    # geforce-now requires flatpak, with org.freedesktop.Platform, on version freedesktop-sdk-24.08.29
    # i don't know how to put it in here so i'll just comment it here
  };
}
