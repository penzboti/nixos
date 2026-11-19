{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # helix # latest main repo release
    steelix # the fork with extensions; rolling sometimes
    steel

    # language servers
    rust-analyzer
    typescript-language-server
    markdown-oxide
    nixd
    nixfmt
    python313Packages.jedi-language-server # python
    simple-completion-language-server # helix editor snippets
    vscode-json-languageserver
    lemminx # xml
    lua-language-server
    (pkgs.callPackage ../packages/pico8-ls/default.nix {})
  ];

}
