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
        # "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" ]; # default - (minus) hfp
        "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" "hfp_hf" "hfp_ag" "hsp_hs" "hsp_ag" ]; # default + hsp
      };
    };
    "11-bluetooth-policy"."wireplumber.settings" = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
  };
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
  services.blueman.enable = true;

  # battery life enhancement
  services.tlp = {
    enable = true;
    settings.RESTORE_DEVICE_STATE_ON_STARTUP=1
  };
}
