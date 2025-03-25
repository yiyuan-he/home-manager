{ pkgs, ... }:

{
  home.stateVersion = "23.05"; # Set this to the current Home Manager version
  home.username = "yiyuanh";
  home.homeDirectory = "/Users/yiyuanh";
  home.sessionPath = ["$HOME/.local/bin/"];

  home.packages = with pkgs; [
    # Core tools
    git             # Version control
    gh              # GitHub cli tool
    zsh             # Z shell
    fish            # Fish shell
    neovim-nightly  # Editor
    bat             # Better 'cat' command
    fd              # Improved 'find' command
    eza             # Replacement for ls
    tree            # Directory visualization
    ripgrep         # Fast searching
    tmux            # Terminal multiplexer
    stow            # Dotfile management
    unzip           # Required for unpacking downloads
    curl            # Data exchange with a server
    wget            # Alternative download tool
    gzip            # Compression tool
    fzf             # Fuzzy finder
    jq              # JSON processor
    starship        # Prompt with a lot of features
    btop            # Resource monitor
    zoxide          # Smarter cd
    cmake           # Cross-platform build system generator, needed by many plugins

    jdt-language-server # Java language server
    lua-language-server # Lua language server
    pyright             # Python language server
    ruff                # Python linter
  ];
}
