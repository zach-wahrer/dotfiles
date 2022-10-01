require("bufferline").setup({
  options = {
    max_name_length = 50,
    max_prefix_length = 20,
    truncate_names = false,
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    sort_by = "directory",
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        highlight = "Directory",
        text_align = "left",
      },
    },
    close_command = "Bdelete! %d",
    right_mouse_command = "vertical sbuffer %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = "Bdelete! %d",
  },
})
