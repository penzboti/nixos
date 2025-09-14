{
  config,
  pkgs,
  zen-browser,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zen-browser.packages."${system}".default
    # do we need these?
    # firefox
    # firefoxpwa
  ]
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ]; # pwa
    };
  }

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/markdown" = ["zen-beta.desktop" "firefox.desktop"];
    };
    addedAssociations = {
      "text/markdown" = ["zen-beta.desktop" "firefox.desktop"];
    };
  };
}
