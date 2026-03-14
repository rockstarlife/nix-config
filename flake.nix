#/etc/nixos/nix-config/flake.nix
{
  description = "my NixOS setup, kiss and declarative";

inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # nix-cachyos-kernel = {
    #   url = "github:xddxdd/nix-cachyos-kernel/release";
    #   # inputs.nixpkgs.follows = "nixpkgs"; потому что  relese уже его буинарники, собирать не нужно.
    # };

    catppuccin.url = "github:catppuccin/nix";  # main — unstable, свежий
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";  # твой stable 25.11

    # nix-openclaw.url = "github:openclaw/nix-openclaw"; # my ai assistant
    # nix-openclaw.inputs.nixpkgs.follows = "nixpkgs";


    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";  # ← важно! чтобы не дублировать nixpkgs
  };
};

outputs = { self, nixpkgs, unstable, home-manager, catppuccin, ... } @ inputs: let

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

      specialArgs = { 
        inherit unstablePkgs;
        inherit root;
        inherit inputs;
      };   # делаем unstablePkgs, root, inputs доступным во всех модулях как аргумент

      modules = [
        ./hosts/nixmac/default.nix # основной файл конфигурации машины
        # ./modules/cachyos.nix # for cachyos kernels from xddxdd rep.
      ];
    };

    # standalone home-manager
    homeConfigurations.neo = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;

      extraSpecialArgs = { 
        inherit unstablePkgs root inputs;
        };  # чтобы unstablePkgs был доступен

      modules = [
        ./home/neo/default.nix
        inputs.catppuccin.homeModules.catppuccin
      ];
    };
  };
}
