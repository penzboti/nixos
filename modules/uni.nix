{
  config,
  pkgs,
  ...
}: {

  imports = [
    ./eduroam.nix
    ./virtualisation.nix
  ];

  environment.systemPackages = with pkgs; [
    codeblocks
    teams-for-linux
    rdesktop # for remote desktop
    mochi # flashcards
  ];

}
