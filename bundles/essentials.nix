{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system.nix
    
    ../../modules/cli.nix
    ../../modules/neovim.nix
    # ../../modules/git_config.nix
  ];
}
