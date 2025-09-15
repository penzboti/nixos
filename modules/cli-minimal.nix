{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zip
    unzip
    fastfetch
    gh
  ];
  programs = {
    git.enable = true;
  };
}
