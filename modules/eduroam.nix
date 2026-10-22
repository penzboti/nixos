{ config, pkgs, ... }:
{
  networking.networkmanager.ensureProfiles.profiles = {
    eduroam = {
      connection = {
        id = "eduroam";
        type = "wifi";
        permissions = "";
      };

      wifi = {
        mode = "infrastructure";
        ssid = "eduroam";
      };

      wifi-security = {
        key-mgmt = "wpa-eap";
        proto = "rsn";
      };

      "802-1x" = {
        eap = "ttls";
        identity = "205026@bme.hu";
        anonymous-identity = "anonymous@bme.hu";

        ca-cert = "/etc/ssl/certs/bme-eduroam-ca.pem";

        domain-suffix-match = "eduroam-radius.net.bme.hu";

        phase2-auth = "pap";
        password-flags = 1;

        domain-match = "eduroam-radius.net.bme.hu";
      };

      ipv4 = {
        method = "auto";
      };

      ipv6 = {
        method = "auto";
      };
    };
  };

  networking.networkmanager.ensureProfiles.secrets.entries = [
    {
      file = "/var/lib/NetworkManager/secrets/eduroam-password";
      key = "password";
      # matchId = "eduroam";
      # matchType = "802-11-wireless";
      matchUuid = "e0ca8591-5948-3c69-8474-f35bc56aff0d";
      matchSetting = "802-1x";
      trim = true;
    }
  ];

  environment = {
    shellAliases = {
      eduroam = "sudo nmcli connection up eduroam";
    };
  };
}

# password
# sudo install -d -m 700 /var/lib/NetworkManager/secrets
# sudo sh -c 'printf "%s" "YOUR_BME_PASSWORD" > /var/lib/NetworkManager/secrets/eduroam-password'
# sudo chmod 600 /var/lib/NetworkManager/secrets/eduroam-password
# sudo chown root:root /var/lib/NetworkManager/secrets/eduroam-password

# certificate
# sudo install -Dm644 bme-eduroam-ca.pem /etc/ssl/certs/bme-eduroam-ca.pem
