{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          -- LSP settings
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          -- Diagnostic signs
          local signs = {
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
          }

          for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
          end

          -- Diagnostic configuration
          vim.diagnostic.config({
            virtual_text = true,
            signs = { active = signs },
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
              focusable = false,
              style = "minimal",
              border = "rounded",
              source = "always",
              header = "",
              prefix = "",
            },
          })

          -- LSP keybindings on attach
          vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
              local keymap = vim.keymap.set
              local bufnr = args.buf

              -- Navigation
              keymap("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
              keymap("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
              keymap("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
              keymap("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Show references" })
              keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover documentation" })
              keymap("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })

              -- Code actions
              keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
              keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
              keymap("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { buffer = bufnr, desc = "Format code" })

              -- Diagnostics
              keymap("n", "<leader>dd", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostics" })
              keymap("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous diagnostic" })
              keymap("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next diagnostic" })
              keymap("n", "<leader>dq", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostics to location list" })
            end,
          })

          -- Configure LSP servers with new vim.lsp.config API
          local servers = {
            lua_ls = {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            },
            nil_ls = {
              settings = {
                ["nil"] = {
                  formatting = {
                    command = { "nixpkgs-fmt" },
                  },
                },
              },
            },
          }

          -- Setup servers with capabilities
          for server, config in pairs(servers) do
            config.capabilities = capabilities
            vim.lsp.config[server] = config
          end

          -- Enable all LSP servers
          vim.lsp.enable({ 
            'lua_ls', 
            'nil_ls', 
            'pyright', 
            'ts_ls', 
            'html', 
            'cssls', 
            'jsonls', 
            'rust_analyzer', 
            'gopls' 
          })
        '';
      }
    ];
  };
}