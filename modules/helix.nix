{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    helix

    # steel # it would be better to have built it from source; (just like helix; for extensions)

    # language servers
    rust-analyzer
    typescript-language-server
    markdown-oxide
    nixd
    nixfmt
    python313Packages.jedi-language-server
    simple-completion-language-server
  ];
}
