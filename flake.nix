{
  description = "Mac + NixOs + River + Kiss Arch + Declarative way";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    unstablePkgs = import unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.nixmac = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit unstablePkgs; };
      modules = [
        ./hosts/nixmac/default.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Прямо здесь описываем neo (без отдельного файла пока)
          home-manager.users.neo = {
            home.stateVersion = "25.11";

            # Когда добавим cli/gui — просто imports = [ ../../home/neo/cli.nix ... ];
          };

          home-manager.extraSpecialArgs = { inherit unstablePkgs; };
        }
      ];
    };
  };
}
