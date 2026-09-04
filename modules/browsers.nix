{
  pkgs,
  zen-browser,
  helium,
  ...
}: {
  environment.systemPackages = with pkgs; [
    firefoxpwa # i need it revelaed

    nyxt # keyboard based browser

    zen-browser.packages."${stdenv.hostPlatform.system}".default
    # helium.packages."${stdenv.hostPlatform.system}".default # file-select not working; its also unofficial
  ];


  imports = [
    helium.nixosModules.default
  ];

  programs.helium = {
    enable = true;

    # Optional: override the package
    # package = pkgs.helium;

    # 🚩 Flags - Command-line arguments always passed to Helium
    flags = [
      "--disable-gpu"
      "--ozone-platform-hint=auto"
    ];

    # 🎯 Policies - Written to /etc/chromium/policies/managed/helium-nixos.json
    # Also written to /etc/helium/policies/managed/ for future compatibility
    policies = {
      "BrowserSignin" = 0;                                    # Disable browser signin
      "PasswordManagerEnabled" = false;                        # Disable password manager
      "SyncDisabled" = true;                                  # Disable sync
      # "HomepageLocation" = "https://nixos.org";             # Set homepage
      # "DefaultSearchProviderEnabled" = true;
      # "DefaultSearchProviderSearchURL" = "https://search.nixos.org/?q={searchTerms}";
      # "ExtensionInstallForcelist" = [                          # Pre-install extensions
      #   "cjpalhdlnbpafiamejdnhcphjbkeiagm"                   # uBlock Origin
      # ];
    };
  };

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
      "text/markdown" = ["helium.desktop" "zen-beta.desktop" "firefox.desktop"];
    };
    addedAssociations = {
      "text/markdown" = ["helium.desktop" "zen-beta.desktop" "firefox.desktop"];
    };
  };
}
