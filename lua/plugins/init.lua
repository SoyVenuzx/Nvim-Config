return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    tag = "v0.1.0", -- Optional tag release
    -- config = function()
    -- 	vim.cmd("colorscheme rose-pine")
    -- end,
  })
  use 'olimorris/onedarkpro.nvim'
  use 'wilmanbarrios/palenight.nvim'
  -- use({
  --   'wilmanbarrios/palenight.nvim',
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- })
  use({
    'tanvirtin/monokai.nvim',
    -- config = function ()
    --   vim.cmd("colorscheme monokai_pro")
    -- end,
  })
  use("folke/tokyonight.nvim")
  use("navarasu/onedark.nvim")
  use({ "morhetz/gruvbox" })
  -- use({ "ellisonleao/gruvbox.nvim" })
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }
  -- use({
  -- 	"nvim-lualine/lualine.nvim",
  -- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
  -- })
  use({
    "tamton-aquib/staline.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    event = "BufRead",
    config = "require('staline-config')"
  })

  -- use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({ "windwp/nvim-ts-autotag" })
  use({ "p00f/nvim-ts-rainbow" })
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require "surround".setup { mappings_style = "surround" }
    end
  }
  use({ "windwp/nvim-autopairs" })
  use({ "folke/which-key.nvim" })
  use({ "terrortylor/nvim-comment" })
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-vsnip" })
  use({ "hrsh7th/vim-vsnip" })
  use({ "onsails/lspkind-nvim" })
  use({ "tami5/lspsaga.nvim" })
  use({ "williamboman/nvim-lsp-installer" })
  use({ "mfussenegger/nvim-jdtls" })
  use({ "norcalli/nvim-colorizer.lua" })
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup({ current_line_blame = true })
    end,
  })
  use({ "glepnir/dashboard-nvim" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "akinsho/toggleterm.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95,
          width = 100,
          height = 0.8,
          options = { signcolumn = "no", number = false, cursorline = false },
        },
        plugins = {
          options = { enabled = true, ruler = false, showcmd = false },
          twilight = { enabled = true },
          gitsigns = { enabled = false },
          tmux = { enabled = false },
        },
      })
    end,
  })
  use({
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
        {
          dimming = { alpha = 0.25, color = { "Normal", "#ffffff" }, inactive = true },
          context = 10,
          treesitter = true,
          expand = { "function", "method", "table", "if_statement" },
        },
      })
    end,
  })
  use({ "andweeb/presence.nvim" })
  use 'Mofiqul/dracula.nvim'
  use('MunifTanjim/prettier.nvim')
  use {
    "themaxmarchuk/tailwindcss-colors.nvim",
    module = "tailwindcss-colors",
  }
  use {'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }
end)
