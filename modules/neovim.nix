{
  config,
  pkgs,
  ...
}: {
  # i guess for my config i would need
  # gcc (for treesitter)
  # nodePackages_latest.live-server (for a local static html server)
  # (plus some alr defined packages)
  # environment.systemPackages = with pkgs; [ ];

  programs = {
    neovim = {
      enable = true;
      # defaultEditor = true;
      vimAlias = true;
    };
  };
}
