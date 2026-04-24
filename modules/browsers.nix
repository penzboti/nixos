{
  pkgs,
  zen-browser,
  helium,
  ...
}: {
  environment.systemPackages = with pkgs; [
    firefoxpwa # i need it revelaed

    zen-browser.packages."${stdenv.hostPlatform.system}".default
    helium.packages."${stdenv.hostPlatform.system}".default
  ];

  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ]; # its not revealed here
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
