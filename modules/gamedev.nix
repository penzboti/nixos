{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    godot # game engine
    # libresprite # aseprite but libre # have it on steam
    ldtk # level editing toolkit
    # blender
    # audacity
  ];
}
