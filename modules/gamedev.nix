{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # game
    godot
    libresprite # aseprite
    ldtk # level editing toolkit

    # video (might separate from here)
    obs-studio # 
    shotcut # a cross platform video editor; would prob be too large
  ];
}
