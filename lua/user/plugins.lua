-- Additional Plugins
lvim.plugins = {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

  -- Treesitter
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  -- Lsp
  ---- golang
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  {
    'crusj/hierarchy-tree-go.nvim',
    dependencies = 'neovim/nvim-lspconfig'
  },
  {
    "stevearc/aerial.nvim", --Outline
    config = function()
      require("aerial").setup()
    end,
  },
  -- ui
  "opalmay/vim-smoothie", -- Плавное прокручивание буфера
  {
    "j-hui/fidget.nvim",  -- Нотификация в правом углу экрана
    -- tag = "legacy",
    -- event = "LspAttach",
  },
  "NvChad/nvim-colorizer.lua", -- Колорайзер
  "ghillb/cybu.nvim",          -- Навигация по буферу
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },
  {
    "kevinhwang91/nvim-bqf", -- Превью буфера quickfix
    version = false
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
    end
  },

  -- find and replase
  "windwp/nvim-spectre",

  -- git
  {
    "f-person/git-blame.nvim",
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <author> • <date> • <summary> ", -- template for the blame message, check the Message template section for more options
      date_format = "%d.%m.%Y %H:%M:%S", -- template for the date, check Date format section for more options
    },
  },

  -- A.I.
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
      vim.keymap.set("i", "<A-w>", neocodeium.accept_word)
      vim.keymap.set("i", "<A-a>", neocodeium.accept_line)
      vim.keymap.set("i", "<A-e>", neocodeium.cycle_or_complete)
      vim.keymap.set("i", "<A-c>", neocodeium.clear)
    end,
  },
}
