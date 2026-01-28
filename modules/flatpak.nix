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
    packages = [
      # "org.prismlauncher.PrismLauncher" # the setup i want for speedrunning doesn't work on flatpak
    ];
  };
}
