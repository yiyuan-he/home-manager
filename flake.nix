{
  description = "Home Manager configuration";

  inputs = {
    # The main nixpkgs repository
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # The correct home-manager repository URL
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";  # For Apple Silicon Mac
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."yiyuanh" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
}
