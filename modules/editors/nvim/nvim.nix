{ config, lib, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      withPython3 = true;

      extraPackages = with pkgs; [
        python311Packages.python-lsp-server
        ripgrep
      ];

      extraPython3Packages = pyPkgs: with pyPkgs; [
        pylint
      ];

      plugins = with pkgs.vimPlugins; [
        yankring
        nvim-highlight-colors
        lush-nvim
        rose-pine
        zenbones-nvim
        vim-hexokinase
        friendly-snippets
        nvim-lspconfig
        nvim-cmp
        luasnip
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp_luasnip
        cmp-omni
        #cmp-treesitter;
        nvim-treesitter
        (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.python p.nix p.css ]))
        vim-ccls
        fzf-vim
        indentLine
        nvim-autopairs
        rustaceanvim
        julia-vim
        vimtex
      ];

      extraLuaConfig = ''
        require("options")
        require("plugins")
        require("keybindings")
      '';

    };
  };

  home = {
    packages = with pkgs; [
      rnix-lsp
      pyright
      rust-analyzer
      #rustfmt
      clang-tools
      tree-sitter
      black
      nixpkgs-fmt
    ];
  };

  #home.file.".config/nvim/init.lua".source = ./lua/options.lua;
  home.file.".config/nvim/lua".source = ./lua;

}
