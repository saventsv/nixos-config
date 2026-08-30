{pkgs, config, ...}:
{

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    vim # backup

    # language servers
    lua-language-server
    typescript-language-server
    gopls
    pyright
    nixd
    bash-language-server
    jdt-language-server
    clang-tools
    rust-analyzer-unwrapped

    tree-sitter

    # tree-sitter parsers
    # trying to have nvim handle the parsers
    (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      p.lua
      p.go
      p.nix
      p.elixir
      p.erlang
      p.c
      p.python
      p.bash
      p.java
      p.qmljs
      p.typescript
      p.rust
    ]))
  ];
}
