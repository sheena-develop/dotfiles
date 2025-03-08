local vim = vim or require("vim")

-- 警告の出ているPerlとRubyのproviderを使わないので、無効化
--vim.g.loaded_perl_provider = 0
--vim.g.loaded_ruby_provider = 0

require("base")
require("autocmd")
require("option")
require("keymap")
require("plugin")
-- require("noice").notify("Test notice.")

