{
  config,
  pkgs,
  ...
}: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true; # for https://codeberg.org/unspeaker/tek maybe
  };
  environment.systemPackages = with pkgs; [
    playerctl # display playing audio
    pamixer # audio level tool
    pavucontrol # audio device switching tool and stuff
  ]
}
