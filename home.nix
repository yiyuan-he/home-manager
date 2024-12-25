{ pkgs, ... }:

{
  home.stateVersion = "23.05"; # Set this to the current Home Manager version
  home.username = "yiyuanh";
  home.homeDirectory = "/Users/yiyuanh";
  home.sessionPath = ["$HOME/.local/bin/"];

  home.packages = with pkgs; [
    # Core tools
    git             # Version control
    zsh             # Z Shell
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

    # Build essentials
    cmake           # Cross-platform build system generator, needed by many plugins
    gnumake         # GNU Make build tool
    gcc             # GNU Compiler Collection
    pkg-config      # Helper tool used during compilation

    # Python and tools
    python311
    python311Packages.black
    python311Packages.pylint
    python311Packages.pytest
    python311Packages.virtualenv

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

    # Nerd font
    nerd-fonts.fira-code
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      vim = "nvim";
      ls = "eza";
    };

    initExtra = ''
      # Enable emacs-style keybindings
      bindkey -e
    '';
  };

  # Add aliases to your shell
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

