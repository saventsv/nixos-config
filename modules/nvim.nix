{pkgs, config, ...}:
{

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
    elixir-ls


    # quickshell lsp
    qt6.qtdeclarative   
    qt6.qttools

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
    ]))
  ];
}
