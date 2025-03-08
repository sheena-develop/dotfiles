-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

map("n", "K", ":bn<CR>")
map("n", "J", ":bp<CR>")

-- ESC連打で検索のハイライト解除する
map("n", "<Esc><Esc>", ":nohlsearch<CR><Esc>")
