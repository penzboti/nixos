{
  config,
  pkgs,
  ...
}: {
  # bluetooth setup for audio
  services.pipewire.wireplumber.extraConfig = {
    bluetoothEnhancements = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.codecs" = [ "sbc" "sbc_xq" "aac" ]; # default includes all
        # hsp
        # "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" ]; # default - (minus) hfp (no calls)
        "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" "hfp_hf" "hfp_ag" "hsp_hs" "hsp_ag" ]; # default + hsp (doesnt work on some devices)
        "bluez5.enable-msbc" = true; # some codec based on hsp/hfp
      };
    };
    "11-bluetooth-policy"."wireplumber.settings" = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
  };

  # allow device to control media
  # services.mpris-proxy.enable = true;
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };

  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
  services.blueman.enable = true;

  services.tlp = {
    # restore bluetooth state (needs powermanagement)
    # doesn't work
    settings.RESTORE_DEVICE_STATE_ON_STARTUP = 1;
    settings.DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth"; # still doesn't work
  };

  # systemd.services.bluetooth-off-at-boot = {
  #   description = "Turn Bluetooth off at startup";
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "bluetooth.service" ];
  #   requires = [ "bluetooth.service" ];

  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.util-linux}/bin/rfkill block bluetooth";
  #   };
  # };
}
