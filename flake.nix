{
    description = "L1ghtr-PRTS";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";

        nix-flatpak.url = "github:gmodena/nix-flatpak";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
          };
      };

      outputs = { nixpkgs, home-manager, nix-flatpak, ... }@inputs:
        let
          lib = nixpkgs.lib;
          system = "x86_64-linux";
          pkgs = import nixpkgs { inherit system; };
        in {
            homeConfigurations = {
                myprofile = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    extraSpecialArgs = { inherit inputs; };
                    modules = [ ./home.nix ];
                  };
              };
          };

  }
