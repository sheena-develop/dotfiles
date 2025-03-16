return {
  -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
  ensure_installed = {
    "vimls",                           -- VimScript
    "lua_ls",                          -- Lua
    "ts_ls",                           -- TypeScript, JavaScript
    "vuels",                           -- Vue
    "html",                            -- HTML
    "cssls",                           -- CSS
    "jsonls",                          -- JSON
    "yamlls",                          -- YAML
    "markdown_oxide",                  -- Markdown
    "dockerls",                        -- Docker
    "docker_compose_language_service", -- Docker Compose
    -- "pylsp",                        -- Python
  },
  automatic_installation = true,
}
