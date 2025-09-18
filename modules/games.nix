{
  config,
  pkgs,
  ...
}:
  let retroarchCores = (pkgs.retroarch.withCores (cores: with cores; [
    # mupen64plus-next
    mupen64plus
    mesen-s
    nestopia
  ]));
  in
{
  environment.systemPackages = with pkgs; [
    # official launcher
    itch
    # unofficial launcher
    heroic-unwrapped
    legendary-gl
    # streaming
    gfn-electron
    # emulators
    retroarchCores
    dolphin-emu
  ];

  programs = {
    steam.enable = true;
  };
}
