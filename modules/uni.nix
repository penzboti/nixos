{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    codeblocks
  ];
}
