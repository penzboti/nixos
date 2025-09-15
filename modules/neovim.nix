{
  config,
  pkgs,
  ...
}: {
  # i guess for my config i would need libgcc and live-server (plus some alr defined packages)
  # environment.systemPackages = with pkgs; [ ];

  programs = {
    neovim = {
      enable = true;
      # defaultEditor = true;
      vimAlias = true;
    };
  };
}
