{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    wifi.backend = "wpa_supplicant";
  };

  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-network-displays
    iw
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  networking.firewall = {
    allowedTCPPorts = [ 7236 ];
    allowedUDPPorts = [ 7236 5353 ];
  };
}
