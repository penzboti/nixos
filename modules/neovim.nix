{
  config,
  pkgs,
  ...
}: {
  # environment.systemPackages = with pkgs; [
  # ];
  programs = {
    neovim = {
      enable = true;
      # defaultEditor = true;
      vimAlias = true;
    };
  };
}
