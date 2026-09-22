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
  ];

}
