{pkgs, config, ...}:
{

  environment.systemPackages = with pkgs; [
    neovim
    vim # backup

    # language servers
    lua-language-server
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

    # tree-sitter parsers
    (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      p.go
      p.lua
      p.c
      p.python
      p.nix
      p.bash
      p.java
      p.elixir
      p.qmljs
    ]))
  ];

}
