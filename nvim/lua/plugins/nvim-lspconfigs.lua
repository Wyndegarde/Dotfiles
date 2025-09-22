local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
  require("neoconf").setup({})
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  })
  vim.diagnostic.config({
    virtual_text = {
      enabled = true,
      source = "if_many",
      prefix = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
          return "✗"
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
          return "⚠"
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
          return "ⓘ"
        else
          return "●"
        end
      end,
      format = function(diagnostic)
        return string.format("%s (%s)", diagnostic.message, diagnostic.source)
      end,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "if_many",
      header = "",
      prefix = "",
    },
  })
  -- lua
  vim.lsp.config['lua_ls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  }
  vim.lsp.enable("lua_ls")

  -- json
  vim.lsp.config['jsonls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
  }
  vim.lsp.enable("jsonls")

  -- python
  -- lspconfig.pyright.setup({
  -- 	-- capabilities = capabilities,
  -- 	-- on_attach = on_attach,
  -- 	settings = {
  -- 		pyright = {
  -- 			disableOrganizeImports = true,
  -- 			analysis = {
  -- 				ignore = { "*" },
  -- 				-- useLibraryCodeForTypes = true,
  -- 				-- autoSearchPaths = true,
  -- 				-- diagnosticMode = "workspace",
  -- 				-- autoImportCompletions = true,
  -- 			},
  -- 		},
  -- 	},
  -- })
  vim.lsp.config['basedpyright'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      basedpyright = {
        analysis = {
          typeCheckingMode = "basic",
        },
      },
    }
  }
  vim.lsp.enable("basedpyright")

  vim.lsp.config['ruff'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
      "python",
      "markdown",
      "yaml"
    },
    init_options = {
      settings = {
        args = {}
      }
    },
  }
  vim.lsp.enable("ruff")

  -- typescript/javascript
  vim.lsp.config['ts_ls'] = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
    root_markers = { "package.json", "tsconfig.json", ".git" },
    settings = {
      typescript = {
        inlayHints = {
          enabled = true,
        },
      },
      javascript = {
        inlayHints = {
          enabled = true,
        },
      },
    },
  }
  vim.lsp.enable("ts_ls")

  -- bash
  vim.lsp.config['bashls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "sh" },
  }
  vim.lsp.enable("bashls")

  -- solidity
  vim.lsp.config['solidity'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "solidity" },
  }
  vim.lsp.enable("solidity")

  -- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
  vim.lsp.config['emmet_ls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "javascript",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "vue",
    },
  }
  vim.lsp.enable("emmet_ls")

  -- docker
  vim.lsp.config['dockerls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  vim.lsp.enable("dockerls")

  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  -- local ruff = require("efmls-configs.linters.ruff")
  local eslint_d = require("efmls-configs.linters.eslint_d")
  local prettierd = require("efmls-configs.formatters.prettier_d")
  local fixjson = require("efmls-configs.formatters.fixjson")
  local shellcheck = require("efmls-configs.linters.shellcheck")
  local shfmt = require("efmls-configs.formatters.shfmt")
  local alex = require("efmls-configs.linters.alex")
  local hadolint = require("efmls-configs.linters.hadolint")
  local solhint = require("efmls-configs.linters.solhint")

  -- configure efm server
  vim.lsp.config['efm'] = {
    filetypes = {
      "lua",
      "python",
      "json",
      "jsonc",
      "sh",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
      "markdown",
      "docker",
      "solidity",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        lua = { luacheck, stylua },
        python = {},
        typescript = { eslint_d, prettierd },
        json = { eslint_d, fixjson },
        jsonc = { eslint_d, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint_d, prettierd },
        javascriptreact = { eslint_d, prettierd },
        typescriptreact = { eslint_d, prettierd },
        svelte = { eslint_d, prettierd },
        vue = { eslint_d, prettierd },
        markdown = { alex, prettierd },
        docker = { hadolint, prettierd },
        solidity = { solhint },
      },
    },
  }
  vim.lsp.enable("efm")
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
