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
  ];

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

      # Set default editor to nvim
      set -gx EDITOR nvim
      set -gx VISUAL nvim

      # Configure fzf to use catppuccin colors
      set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=selected-bg:#45475a \
      --multi"

      starship init fish | source

      /Users/yiyuanh/.local/bin/mise activate fish | source
    '';
  };
}
