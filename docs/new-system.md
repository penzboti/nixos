# prebuild
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
environment.systemPackages = with pkgs; [
  helix # or editor of choice
];
programs.git.enable = true;
```

# post prebuild
```sh
cd ~
git clone https://github.com/penzboti/nixos.git
```
also add home-manager
```sh
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
```

# build a new configuration.
copy over from current configuration to the corresponding host folder:
- boot loader
- hardware-configuration.nix

# run build
- just replace `<system>` with the system of choice
```sh
sudo nixos-rebuild switch --flake ~/nixos.#<system>
```
