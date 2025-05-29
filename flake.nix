{
  # from https://github.com/vimjoyer/flake-starter-config
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      # system = "x86_64-linux";
      # system = system;
      config.allowUnfree = true;
      allowUnfree = true;
      config.permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
      ];
    };
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        pkgs = pkgs;
      };
      modules = [
        ./configuration.nix
        # inputs.home-manager.nixosModules.default
        ./modules/spicetify.nix
        ./modules/sddm.nix
      ];
    };
  };
}
