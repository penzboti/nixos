{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    helix

    # language servers
    rust-analyzer
    typescript-language-server
    markdown-oxide
    nixd
    python313Packages.jedi-language-server
  ];
}
