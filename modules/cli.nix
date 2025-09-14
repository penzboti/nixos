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
    gitui
  ];
  programs = {
    git.enable = true;
  };
}
