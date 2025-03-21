-- Additional Plugins
lvim.plugins = {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  -- Treesitter
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  -- Lsp
  ---- golang
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
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
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
  },
  {
    "renerocksai/telekasten.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  "ThePrimeagen/harpoon",
  "MattesGroeger/vim-bookmarks",

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

  -- DB
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          { "kndndrj/nvim-dbee" }
        },
        ft = "sql", -- optional but good to have
        opts = {},  -- needed
      },
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end
  },
  -- GoDoc
  {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
      { "nvim-telescope/telescope.nvim" }, -- optional
      { "folke/snacks.nvim" },             -- optional
      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          ensure_installed = { "go" },
        },
      },
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" },
    opts = {},
  },
  { 'edluffy/hologram.nvim' },
  {
    "ovk/endec.nvim",
    event = "VeryLazy",
    opts = {
      -- Override default configuration here
    }
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'saghen/blink.compat',
        version = '*',
        opts = {
          enable_events = true
        },
      },
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
      },
    },
    version = '*',
    opts_extend = { "sources.default" }
  },
  { "xzbdmw/colorful-menu.nvim" },
  { 'arnamak/stay-centered.nvim' },
  { 'jbyuki/one-small-step-for-vimkind' },
  { 'mfussenegger/nvim-dap' },
}
