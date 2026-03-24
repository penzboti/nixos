{
  config,
  pkgs,
  ...
}: let
  retroarchCores = (pkgs.retroarch.withCores (cores: with cores; [
    mupen64plus # n64
    mesen-s # snes & gameboy/color
    nestopia # nes
    melonds # ds
    citra # 3ds
  ]));
in {
  environment.systemPackages = with pkgs; [
    # official launcher
    itch

    # minecraft
    (prismlauncher.override { additionalLibs = with pkgs; [ libxtst libxkbcommon libxt ]; }) # speedrunning works now
    waywall # speedrunning
    jdk # running jar files for speedrunning
    # logmein-hamachi # open-to-lan private server

    # unofficial launcher
    # heroic-unwrapped
    # legendary-gl

    # decompiled games
    # note: they crash the school laptop during building
    # shipwright # ocarina of time
    # spaghettikart # mariokart 64
    # _2ship2harkinian # majoras mask

    # emulators
    # retroarchCores # see up top
    # dolphin-emu # gamecube & wii
    # ryubing # switch
  ];

  programs = {
    steam.enable = true;
  };
}
