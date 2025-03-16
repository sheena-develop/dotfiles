-- https://github.com/voldikss/vim-translator?tab=readme-ov-file#configuration
return function ()
  vim.g.translator_target_lang = "ja"
  vim.g.translator_default_engines = { "google" }
  vim.g.translator_history_enable = true
  vim.g.translator_window_type = "popup"
  vim.g.translator_window_max_width = 0.5
  vim.g.translator_window_max_height = 0.9 -- 1 is not working
end
