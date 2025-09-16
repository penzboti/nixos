{
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

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        pkgs = pkgs;
      };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default
        ./modules/spicetify.nix
        ./modules/sddm.nix
      ];
    };
  };
}
