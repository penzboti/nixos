{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/system.nix
    
    ../modules/cli-minimal.nix
    ../modules/neovim.nix
    # ../../modules/git_config.nix
  ];
}
