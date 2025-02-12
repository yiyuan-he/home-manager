{ pkgs, ... }:

{
  home.stateVersion = "23.05"; # Set this to the current Home Manager version
  home.username = "yiyuanh";
  home.homeDirectory = "/Users/yiyuanh";
  home.sessionPath = ["$HOME/.local/bin/"];

  home.packages = with pkgs; [
    # Core tools
    git             # Version control
    zsh             # Z shell
    fish            # Fish shell
    neovim-nightly  # Editor
    bat             # Better 'cat' command
    fd              # Improved 'find' command
    eza             # Replacement for ls
    tree            # Directory visualization
    ripgrep         # Fast searching
    direnv          # For automatic environment switching
    nix-direnv      # Better caching for direnv
    tmux            # Terminal multiplexer
    stow            # Dotfile management
    unzip           # Required for unpacking downloads
    curl            # Data exchange with a server
    wget            # Alternative download tool
    gzip            # Compression tool
    fzf             # Fuzzy finder
    jq              # JSON processor
    starship        # Prompt with a lot of features

    # Build essentials
    cmake           # Cross-platform build system generator, needed by many plugins
    gnumake         # GNU Make build tool
    gcc             # GNU Compiler Collection
    pkg-config      # Helper tool used during compilation

    # Python and tools
    python311
    pyright

    # Node.js and tools
    nodejs_20
    nodePackages.typescript
    nodePackages.typescript-language-server

    # Go and tools
    go
    gopls
    golangci-lint

    # Rust and tools
    rustc
    cargo
    rust-analyzer
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      vim = "nvim";
      ls = "eza";
    };

    interactiveShellInit = ''
      # Make nix available in fish so we can find packages and use cli commands
      set -gx PATH $HOME/.nix-profile/bin $HOME/.nix-profile/sbin $PATH
      set -gx PATH /nix/var/nix/profiles/default/bin /nix/var/nix/profiles/default/sbin $PATH

      # Configure fzf to use Everforest colors
      set -gx FZF_DEFAULT_OPTS '--color=fg:#d7c7a3,bg:#2b3339,hl:#e0af68,fg+:#d7c7a3,bg+:#353b41,hl+:#e0af68,info:#a7c080,prompt:#7fbbb3,pointer:#d27f99,marker:#d699b6,spinner:#83c092,header:#a0a8b0'

      starship init fish | source
    '';
  };
}
