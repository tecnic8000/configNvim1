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
      git = {
        enable = true,
        ignore = false, -- Show files even if in .gitignore
      },
      auto_reload_on_write = true,
    }

    -- auto open upon startup
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.isdirectory(vim.fn.argv()[1] or '') == 1 then
          require('nvim-tree.api').tree.open()
        end
      end,
    })
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
