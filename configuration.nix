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
    jack.enable = true; # for https://codeberg.org/unspeaker/tek
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

  # some ideas are from: https://www.namtao.com/oxidise-your-cli-2025/
  # TODO: with home manager and whatnot split this into gui and only cmd applications
  # somehow you can make two devices use this configuration and it would be useful for this
  # and also other distros can use this as a package manager but don't use hyprland in that situation please
  environment.systemPackages = with pkgs; [
    # NOTE: applications
    discord
    obsidian 
    firefoxpwa
    qimgv # media viewer
    inputs.zen-browser.packages."${system}".default
    gfn-electron
    itch
    # NOTE: hyprland system
    rofi
    waybar
    hyprpaper
    wl-clipboard-rs
    hyprshot # screenshot tool
    hyprlock
    swaynotificationcenter
    udiskie # automount external storage devices TODO: need hyprland start
    # other ui stuff for hyprland (like other distros might have these already)
    xfce.thunar # file manager
    gnome-tweaks # set thunar theme and mouse cursor theme
    webcamoid # camera app
    kanagawa-gtk-theme
    kanagawa-icon-theme
    bibata-cursors # it apears in gnome tweaks
    # system utilities
    zip
    unzip
    playerctl # display playing audio
    pamixer # audio level tool
    # NOTE: cli utilities
    gh
    betterdiscordctl
    gcc # need for bunch of apps and functions globally
    gitui # better than lazygit
    portal # send files across devices
    fastfetch # neofetch was archived
    chafa # image viewer (but in the terminal)
    eza # better ls
    bat # cat with syntax highlighting
    ripgrep-all # rg + docs, pdfs & zip files
    # less important ones
    wget # needed for sg idk
    libnotify # custom notifiactions
    networkmanagerapplet # wifi gui interface; in system tray, which sounds meh
    uutils-coreutils-noprefix # faster coreutils; idk if it works
    presenterm #!! untested
    # NOTE: shells & stuff
    ghostty
    kitty
    oh-my-posh # for bash
    oh-my-fish # for fish (i think i can rule this out tho atp)
    bash-completion
    # NOTE: ide / text editor stuff
    neovim
    # helix (build from source since i need plugins)
    steel
    # (builtins.getFlake "github:helix-editor/helix").packages.${pkgs.system}.default # i would imagine this is helix master branch !! untested
    yazi # terminal file editor
    ripgrep
    nodePackages_latest.live-server
    fd # find files
    fzf # find files also
    dotnet-sdk_6 # the sdk 10 can be used with nix-shell -p
    # NOTE: left out
    # obs-studio # too big
    # libresprite # too big
    # ldtk # too big
    # discordo # could also be cool
    # notion-app-enhanced # doesnt work
    # zed-editor # don't need bc of nvim
    # vlc # might not need it bc of qimgv (in testing phase currently)
    # wiki-tui # if you need it, -p it
    # ncspot # terminal spotify client, which does not work with free accounts
    # zellij # instead of tmux, but i never used either of them yet
    # rainbowstream # twitter client loool (i would maybe get addicted)
    # nushell # a shell that i didn't try yet
    # fselect # select files with sql syntax; statistically im not gonna use it
    # dua # storage tool; statistically im not gonna use it
  ];

  programs = {
    git.enable = true;
    hyprland.enable = true;
    steam.enable = true;
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ]; # pwa
    };
    fish.enable = true; # try it, but don't set it as the default. https://nixos.wiki/wiki/Fish
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
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

  environment = {
    sessionVariables = { # NOTE: doesn't need system relog; regular variables do.
      DOTNET_ROOT = "${pkgs.dotnet-sdk_6}/share/dotnet/"; # https://www.reddit.com/r/NixOS/comments/15j1283/is_it_possible_to_add_shellaliases_if_package_is/
    };

    shellAliases = {
      # system
      shut = "shutdown -h now";
      uefi = "systemctl reboot --firmware-setup";
      space = "df -h | grep -E 'nvme0n1p1|Filesystem|/dev/disk/by-uuid/'";
      devices = "sudo fdisk -l";
      ip_private = "ip a";
      ip_public = "curl ipinfo.io/ip";
      brightness = "light";
      volume = "pamixer --get-volume";
      battery="upower -i $(upower -e | grep 'BAT') | grep -E 'state|to full|percentage'";
      # nix
      buildnix = "sudo nixos-rebuild switch --flake ~/nixos/#default"; 
      updateflake = "nix flake update --flake ~/nixos";
      garbage = "sudo nix-collect-garbage -d";
      optimise_verbose = "nix-store --optimise -vv";
      optimise = "nix store optimise";
      # programs
      dashboard = "nix-shell -p btop --run btop"; # kinda unnecessary and i didn't even use it once.
      tek = "/home/penzboti/manual/tek";
      firewall = "/home/penzboti/scripts/firewall.sh"; # mostly for pico park lol
      hotspot = "nix-shell -p linux-wifi-hotspot --run 'nmcli r wifi off; rfkill unblock wlan; wihotspot-gui; nmcli r wifi on'"; # mostly for pico park lol
      hx = "/home/penzboti/.cargo/bin/hx";
    };
  };

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/markdown" = ["zen-beta.desktop" "firefox.desktop"];
    };
    addedAssociations = {
      "text/markdown" = ["zen-beta.desktop" "firefox.desktop"];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

}
