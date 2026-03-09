{
  nix-flatpak,
  ...
}: {
  imports = [
    "${nix-flatpak}/modules/nixos.nix"
  ];

  # nix-flatpak flake:
  # automatically adds flathub as a remote
  # installs during an activation phase: makes that phase take long
  # if it doesn't install, remove the package (from config), rebuild, then readd, then rebuild

  # geforce-now released a linux version, which is being handled by flatpak
  # use the installer

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.astralvixen.geforce-infinity"
    ];
  };
}
