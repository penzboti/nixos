{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    yazi # terminal file editor
    (ncspot.override { withCover = true; }) # terminal spotify client
    ueberzugpp # for ncspot cover feature
    gitui
    ripgrep
    ripgrep-all
    fd # find files
    fzf # find files also
    uutils-coreutils-noprefix # faster coreutils; idk if it works
    btop # dashboard
  ];

  programs.fish.enable = true;
}
