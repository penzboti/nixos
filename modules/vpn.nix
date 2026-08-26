{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    strongswan
  ];

  services.strongswan.enable = true;
  environment.etc."strongswan.conf".text = "";
}
