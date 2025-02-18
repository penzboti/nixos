{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Budapest";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  console = {
    #font = "Lat2-Terminus16";
    #keyMap = "hu";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.xserver = {
    enable = true;
    xkb.layout = "hu";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  services.pipewire.wireplumber.extraConfig = {
  bluetoothEnhancements = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
  # "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.codecs" = [ "sbc" "sbc_xq" "aac" ];
      "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" ];
    };
  };
  "11-bluetooth-policy"."wireplumber.settings" = {
    "bluetooth.autoswitch-to-headset-profile" = false;
  };
};

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

  system.stateVersion = "24.05"; # DO NOT CHANGE IN ANY CIRCUMSTANCES

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    kitty
    discord
    vscode
    rofi
    waybar
    hyprpaper
    gh
    betterdiscordctl
    zip
    unzip
    wl-clipboard-rs
    oh-my-posh
    wget
    gcc
    bash-completion
    hyprshot
    obsidian 
    vlc
    gitui
    kdePackages.dolphin
    portal
    inputs.zen-browser.packages."${system}".default
# these three are cool apps, but i hardly ever use them. maybe nix-shell -p works
    # obs-studio
    # libresprite
    # ldtk
    hyprlock
    swaynotificationcenter
    firefoxpwa
    playerctl
    pamixer
    # ghostty # could be cool
    # discordo # could also be cool
    # notion-app-enhanced # doesnt work
    zed-editor
    fastfetch
    # nvim config packages
    fd
    ripgrep
    nodePackages_latest.live-server
    fzf
    # until here
  ];

  programs.git.enable = true;
  programs.hyprland.enable = true;

  users.users.penzboti = {
    isNormalUser = true;
    home = "/home/penzboti";
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };

  # old audio suite
  # hardware.sound.enable = true;
  # hardware.pulseaudio = {
  #   enable = lib.mkForce true;
  #   support32Bit = true;
  # };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts-cjk-sans
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontDir.enable = true;

  programs.steam.enable = true;
  # programs.java.enable = true;

  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
  services.blueman.enable = true;

  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings.DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "penzboti" = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true;
  hardware.trackpoint.emulateWheel = true;
  services.libinput.mouse.accelSpeed = "0.0";
  services.libinput.mouse.disableWhileTyping = true;
  services.libinput.touchpad.sendEventsMode = "disabled-on-external-mouse";

  programs.light.enable = true;
  services.upower.enable = true;

  # pwa
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };
}
