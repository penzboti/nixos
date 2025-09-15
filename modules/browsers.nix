{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
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
