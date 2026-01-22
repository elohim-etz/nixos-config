{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      # Completion engine
      nvim-cmp
      
      # Completion sources
      cmp-nvim-lsp    # LSP completions
      cmp-buffer      # Buffer completions
      cmp-path        # Path completions
      cmp-cmdline     # Command line completions
      
      # Snippets
      luasnip
      cmp_luasnip
      friendly-snippets
      
      # Icons in completion menu
      lspkind-nvim
      
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require("cmp")
          local luasnip = require("luasnip")
          local lspkind = require("lspkind")

          -- Load friendly snippets
          require("luasnip.loaders.from_vscode").lazy_load()

          cmp.setup({
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            
            -- Window appearance
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
            
            -- Keybindings for completion
            mapping = cmp.mapping.preset.insert({
              ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
              ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(), -- Show completion
              ["<C-e>"] = cmp.mapping.abort(), -- Close completion
              ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
              
              -- Tab to jump through snippet placeholders
              ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" }),
              
              ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" }),
            }),
            
            -- Sources for completion (order matters)
            sources = cmp.config.sources({
              { name = "nvim_lsp" }, -- LSP
              { name = "luasnip" },  -- Snippets
              { name = "path" },     -- File paths
            }, {
              { name = "buffer" },   -- Text in current buffer
            }),
            
            -- Icons and formatting
            formatting = {
              format = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                ellipsis_char = "...",
              }),
            },
          })

          -- Command line completion
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "path" },
              { name = "cmdline" },
            },
          })
        '';
      }
    ];
  };
}
