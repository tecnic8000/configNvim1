return {
  'nvim-tree/nvim-tree.lua',
  event = 'VimEnter', --doesnt work
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 25,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      auto_reload_on_write = true,
    }
  end,
}

-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
--vim.opt.termguicolors = true

-- empty setup using defaults
--require("nvim-tree").setup()

-- OR setup with some options
