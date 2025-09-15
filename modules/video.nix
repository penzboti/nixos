{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    obs-studio # video recording & streaming
    shotcut # a cross platform video editor; would prob be too large
  ];
}
