return function()
  local lspconfig = require("lspconfig")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- capabilities をすべてのLSPに追加
  local servers = {
    "vimls",
    "lua_ls",
    "ts_ls",
    "vuels",
    "html",
    "cssls",
    "jsonls",
    "yamlls",
    "markdown_oxide",
    "dockerls",
    "docker_compose_language_service",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      capabilities = capabilities,
    })
  end

  -- VimScript
  lspconfig.vimls.setup({})

  -- Lua
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
      }
    }
  })

  -- TypeScript, JavaScript
  lspconfig.ts_ls.setup({})

  -- Vue
  lspconfig.vuels.setup({})

  -- HTML
  lspconfig.html.setup({})

  -- CSS
  lspconfig.cssls.setup({})

  -- JSON
  lspconfig.jsonls.setup({})

  -- YAML
  lspconfig.yamlls.setup({})

  -- Markdown
  lspconfig.markdown_oxide.setup({})

  -- Docker
  lspconfig.dockerls.setup({})

  -- Docker Compose
  lspconfig.docker_compose_language_service.setup({})

  -- Python
  -- lspconfig.pylsp.setup({})
end
