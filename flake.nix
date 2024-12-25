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

    # Neovim nightly builds
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs = { nixpkgs, home-manager, neovim-nightly-overlay, ... }:
    let
      system = "aarch64-darwin";  # For Apple Silicon Mac

      # Define our overlay as a proper function
      # This creates a new package set with neovim-nightly available
      myOverlays = [
        (final: prev: {
          # We explicitly name it 'neovim-nightly' here so we can reference it by this name
          neovim-nightly = neovim-nightly-overlay.packages.${system}.neovim;
        })
      ];

      # Create our modified package set
      pkgs = import nixpkgs {
        inherit system;
        overlays = myOverlays;
      };
    in {
      homeConfigurations."yiyuanh" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
}
