{
  config,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    yazi # terminal file editor
    ncspot # terminal spotify client
    gitui
    ripgrep
    ripgrep-all
    fd # find files
    fzf # find files also
    uutils-coreutils-noprefix # faster coreutils; idk if it works
  ];
}
