-- https://github.com/crnvl96/lazydocker.nvim
return {
  popup_window = {
    enter = true,
    focusable = true,
    zindex = 40,
    position = "50%",
    relative = "win",
    size = {
      width = "90%",
      height = "90%",
    },
    buf_options = {
      modifiable = true,
      readonly = false,
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      winblend = 0,
    },
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " Lazydocker ",
      },
    },
  },
}
