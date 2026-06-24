{pkgs, config, ...}:
{

  envoronment.systemPackages = with pkgs; [
    neovim
    vim # backup

    # language servers
    lua-language-server
    gopls
    pyright
    nixd
    bash-language-server
    jdt-language-server

    # tree-sitter parsers
    (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      p.go
      p.lua
      p.c
      p.python
      p.nix
      p.bash
      p.java
    ]))
  ];

}
