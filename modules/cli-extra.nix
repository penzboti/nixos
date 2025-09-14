{
  config,
  pkgs,
  ...
}: {
  fish.enable = true;
  environment.systemPackages = with pkgs; [
    yazi # terminal file editor
    ripgrep
    ripgrep-all
    fd # find files
    fzf # find files also
  ];
}
