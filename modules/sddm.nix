{pkgs, ...}: let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    # themeConfig = {
    #   AccentColor = "#746385";
    #   FormPosition = "left";
    #
    #   ForceHideCompletePassword = true;
    # };
    embeddedTheme = "black_hole";
  };
in {

  environment.systemPackages = [ sddm-astronaut ];

  systemd.services.display-manager.enable = true;

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm; # qt6 sddm version

    theme = "sddm-astronaut-theme";
    extraPackages = [sddm-astronaut];

    wayland.enable = true;
  };
}
