require("config.lazy")
require("mason").setup()
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})
require("lualine").setup()
require("ibl").setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--
--	LSPs and cmps
--

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Example configuration for HTML LSP
require('lspconfig').html.setup {
  capabilities = capabilities,
}

-- Configuration for CSS LSP
require('lspconfig').cssls.setup {
  capabilities = capabilities,
}

-- Configuration for JavaScript LSP
require('lspconfig').ts_ls.setup {
  capabilities = capabilities,
}


--
--	Dashboard
--

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
  dashboard.button( "e", "  > New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button( "f", "  > Search for file", ":Telescope find_files<CR>"),
    dashboard.button( "t", "  > Search for Text in files", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  > Settings", ":edit ~/.config/nvim/init.lua <CR>"),
  dashboard.button( "s", "🔧 > Plugins", ":e ~/.config/nvim/lua/config/lazy.lua<CR>"),
  dashboard.button( "q", "  > Exit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- 
-- 	Shortcuts
--

vim.api.nvim_set_keymap('n', '<leader>', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':Telescope oldfiles<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>p', ':vsplit <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>)o', ':split <CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'f', ':Neotree <CR>',{noremap = true, silent = true})

vim.g.mapleader = ' '
