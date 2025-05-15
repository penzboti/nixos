{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  #############
  ### NIXOS ###
  #############

  system.stateVersion = "24.05"; # DO NOT CHANGE IN ANY CIRCUMSTANCE

  users.users.penzboti = {
    isNormalUser = true;
    home = "/home/penzboti";
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "penzboti" = import ./home.nix;
    };
  };

  programs.nix-ld.enable = true; # run precompiled binaries on nix

  # https://nixos.wiki/wiki/Storage_optimization
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';

  ##############
  ### SYSTEM ###
  ##############

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Budapest";

  networking.networkmanager.enable = true;

  powerManagement.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  ################
  ### HARDWARE ###
  ################

  # touchpad
  hardware.trackpoint.emulateWheel = true;
  services.libinput.mouse.accelSpeed = "0.0";
  services.libinput.mouse.disableWhileTyping = true;
  services.libinput.touchpad.sendEventsMode = "disabled-on-external-mouse";

  # keyboard
  console.useXkbConfig = true; # use xkb.options in tty.
  services.xserver = {
    enable = true;
    xkb.layout = "hu";
  };

  # audio
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
        "bluez5.enable-hw-volume" = true;
        "bluez5.codecs" = [ "sbc" "sbc_xq" "aac" ];
        "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" ];
      };
    };
    "11-bluetooth-policy"."wireplumber.settings" = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
  services.blueman.enable = true;
  services.tlp = {
    enable = true;
    settings.DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # old audio suite
  # hardware.sound.enable = true;
  # hardware.pulseaudio = {
  #   enable = lib.mkForce true;
  #   support32Bit = true;
  # };

  ################
  ### PROGRAMS ###
  ################

  environment.systemPackages = with pkgs; [
    kitty
    discord
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
    gcc # need for bunch of apps and functions globally
    bash-completion
    hyprshot # screenshot tool
    obsidian 
    gitui
    lazygit
    xfce.thunar # file manager
    portal # send files across devices
    inputs.zen-browser.packages."${system}".default
    hyprlock
    swaynotificationcenter
    firefoxpwa
    playerctl # display playing audio
    pamixer # audio level tool
    fastfetch
    chafa # image viewer (but in the terminal)
    qimgv # media viewer
    kanagawa-gtk-theme
    kanagawa-icon-theme
    gnome-tweaks # set thunar theme and mouse cursor theme
    webcamoid # camera
    libnotify # custom notifiactions
    udiskie # automount external storage devices TODO: need hyprland start
    networkmanagerapplet # wifi gui interface; in system tray, which sounds meh
    bibata-cursors # it apears in gnome tweaks
    helix
    yazi # for helix file editor
    # NOTE: neovim config packages
    neovim
    fd
    ripgrep
    nodePackages_latest.live-server
    fzf
    # NOTE: left out
    # obs-studio # too big
    # libresprite # too big
    # ldtk # too big
    # ghostty # could be cool
    # discordo # could also be cool
    # notion-app-enhanced # doesnt work
    # zed-editor # don't need bc of nvim
    # vlc # might not need it bc of qimgv (in testing phase currently)
  ];

  programs = { # idk why is there a separate 'programs.'
    git.enable = true;
    hyprland.enable = true;
    steam.enable = true;
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ]; # pwa
    };
  };

  programs.light.enable = true;
  services.upower.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts-cjk-sans
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontDir.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

}
