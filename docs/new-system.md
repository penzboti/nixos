# prebuild
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
environment.systemPackages = with pkgs; [
  helix # or editor of choice
];
programs.git.enable = true;
```

# post prebuild
you shouldn't need this:
- nix run home-manager/master
```sh
cd ~
git clone https://github.com/penzboti/nixos.git
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

# TODO 
home-manager

