return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
          file_status = true,
          newfile_status = false,
          shorting_target = 0,
        },
      },
    },
  },
}
