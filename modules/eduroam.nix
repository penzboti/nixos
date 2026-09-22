{ config, pkgs, ... }:
{
  networking.networkmanager = {
    ensureProfiles = {
      profiles = {
        eduroam = {
          connection = {
            id = "eduroam";
            type = "wifi";
          };

          wifi = {
            mode = "infrastructure";
            ssid = "eduroam";
          };

          wifi-security = {
            key-mgmt = "wpa-eap";
          };

          "802-1x" = {
            eap = "ttls";

            identity = "205026@bme.hu";

            password-flags = 1;

            anonymous-identity = "anonymous@bme.hu";
            phase2-auth = "pap";

            ca-cert = "/etc/ssl/certs/bme-eduroam-ca.pem";
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

      secrets.entries = [
        {
          file = "/var/lib/NetworkManager/secrets/eduroam-password";
          key = "password";
          matchId = "eduroam";
          matchType = "wifi";
          matchSetting = "802-1x";
        }
      ];
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
