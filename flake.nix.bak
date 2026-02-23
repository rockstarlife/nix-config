{
  description = "minimal tty";

inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";  # ← важно! чтобы не дублировать nixpkgs
  };
};

outputs = { self, nixpkgs, unstable, home-manager, ... } @ inputs: let

    system = "x86_64-linux"; # прописываем архитектуру один раз.

    pkgs = import nixpkgs { # стабильная ветка суем ее в переменную pkgs.
      inherit system; # наша архитектура в переменной.
      config.allowUnfree = true; # даем доступ к проприетарным пакетам.
    };

    unstablePkgs = import unstable { # не стабильная ветка суем ее в переменную unstablePkgs.
      inherit system; # наша архитектура в переменной.
      config.allowUnfree = true; # доступ к проприетарным пакетам типо google-chrome
    };

    root = self.outPath;

  in {
    nixosConfigurations.nixmac = nixpkgs.lib.nixosSystem { # здесь мы начинаем строить систему. 
      inherit system; # передаём архитектуру в nixosSystem

      specialArgs = { inherit unstablePkgs root; };   # делаем unstablePkgs доступным во всех модулях как аргумент

      modules = [
        ./hosts/nixmac/default.nix # основной файл конфигурации машины
      ];
    };

    # standalone home-manager
    homeConfigurations.neo = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      extraSpecialArgs = { inherit unstablePkgs root; };  # чтобы unstablePkgs был доступен
      modules = [
        ./home/neo/default.nix
      ];
    };
  };
}
