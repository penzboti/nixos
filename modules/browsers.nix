{
  config,
  pkgs,
  # inputs,
  zen-browser,
  system,
  ...
}: {
  environment.systemPackages = [
    zen-browser.packages."${system}".default # untested
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
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/markdown" = ["zen.desktop" "firefox.desktop"];
    };
    addedAssociations = {
      "text/markdown" = ["zen.desktop" "firefox.desktop"];
    };
  };
}
