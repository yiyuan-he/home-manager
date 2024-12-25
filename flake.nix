{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-home-manager/home-manager";
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
