{ pkgs, ... }:
{
  # https://nixos.wiki/wiki/Hardware/Razer
  environment.systemPackages = with pkgs; [
    razergenie # razer peripherals companion app
    # openrazer-daemon # i think i need this (but idk)
  ];
  hardware.openrazer = {
    enable = true;
    users = [ "penzboti" ];
    batteryNotifier.enable = true;
  };
  # no need, fn+f7 works
  # services.hardware.openrgb = {
  #   enable = true;
  #   package = pkgs.openrgb-with-all-plugins; 
  #   motherboard = "amd";  
  # };
}
