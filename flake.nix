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

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let 
    system = "x86_64-linux";
    username = "penzboti";
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
    specialArgs = {
      inherit inputs;
      inherit pkgs;
      inherit username;
    };
  in {
    nixosConfigurations = {
      # school-issued laptop (original)
      school = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/school
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      };
      # virtual machine
      vm = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/vm
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      }; 
    };
  };
}
