-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  {
	  "olimorris/onedarkpro.nvim"
  },
  {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
  },
    {
    "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.rust_analyzer.setup{}
    end,
  },
  {
	  "nvim-lualine/lualine.nvim",
	  dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
	  "goolord/alpha-nvim",
	  requires = { "nvim-tree/nvim-web-devicons" }
  },
  {
	  "nvim-telescope/telescope.nvim", tag = "0.1.8",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  "nvim-telescope/telescope-project.nvim"
  },
  {
	    {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup({})
    end,
  },
  {
	  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip", -- snippets
    },
        config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        })
      })
    end,
  },
  },
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup({
      filetype = {
        rust = {
          -- Używamy rustfmt do formatowania kodu Rust
          function()
            return {
              exe = "rustfmt",
              args = {"--emit=stdout"},
              stdin = true
            }
          end
        }
      }
    })
  end,
}

}})

vim.cmd("colorscheme onedark")
