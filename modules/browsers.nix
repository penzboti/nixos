{
  config,
  pkgs,
  zen-browser,
  ...
}: {
  environment.systemPackages = [
    zen-browser.packages."${pkgs.system}".default
    # firefoxpwa # its not revealed, but installed (into firefox)
  ];

  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ]; # pwa
    };
  };

  # open markdown files using the ```xdg-open file``` command
  # it should be zen-beta, while zen stays beta.
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
