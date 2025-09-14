{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # official launcher
    itch
    # unofficial launcher
    heroic-unwrapped
    legendary-gl
    # streaming
    gfn-electron
    # emulators
    (retroarch.override {
      cores = with libretro; [
        mupen64plus-next
        mesen-s
        nestopia
];
    })
    dolphin-emu
  ];
  programs = {
    steam.enable = true;
  }
}
