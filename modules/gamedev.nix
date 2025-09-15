{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    godot # game engine
    libresprite # aseprite but libre
    ldtk # level editing toolkit
  ];
}
