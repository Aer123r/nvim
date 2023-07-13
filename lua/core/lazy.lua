-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",

    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      'navarasu/onedark.nvim',
    },
    {
      'rmehri01/onenord.nvim',
    },
    { "AstroNvim/astrotheme" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'vim-airline/vim-airline-themes' },
    {
      'projekt0n/github-nvim-theme',
    },
    { 'dccsillag/magma-nvim',               build = ':UpdateRemotePlugins' },
    -- code runner
    { 'michaelb/sniprun' },
    -- DAP
    { 'mfussenegger/nvim-dap' },
    -- colorful brackets
    { "lukas-reineke/indent-blankline.nvim" },
    -- recent project
    { 'ahmedkhalf/project.nvim' },
    -- kind of lsp
    { 'onsails/lspkind.nvim' },
    -- markdown previewer
    {
      'iamcco/markdown-preview.nvim',
      build = 'cd app && yarn install'
    },
    -- git GUI
    {
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    -- which key
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    --vim-fugitive
    { 'tpope/vim-fugitive' },
    { "meatballs/notebook.nvim" },
    { 'kyazdani42/nvim-web-devicons', lazy = true },
    -- galaxy line
    {
      'glepnir/galaxyline.nvim',
      -- dependencies = {'nvim-tree/nvim-web-devicons'},
    },
    -- Vim-airline
    -- { 'vim-airline/vim-airline' },
    -- bufDelete
    { 'famiu/bufdelete.nvim' },
    -- javascript-react-snipptes
    {
      'dsznajder/vscode-es7-javascript-react-snippets',
      build = 'yarn install --frozen-lockfile && yarn compile'
    },

    { 'voldikss/vim-floaterm' },
    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter' },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },
    -- File explorer
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },
    { 'akinsho/bufferline.nvim' },
    -- toggle terminal
    { 'akinsho/toggleterm.nvim', config = true },
    --telescope
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      -- or                              , branch = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- 
    {
      'stevearc/dressing.nvim',
      opts = {},
    },
    -- LSP
    { 'neovim/nvim-lspconfig' },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opt = {}
    },
    -- auto-catgs
    { 'windwp/nvim-ts-autotag' },
    -- Comment.nvim
    { 'numToStr/Comment.nvim' },
    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    -- null ls
    { 'jose-elias-alvarez/null-ls.nvim' },
    -- Navigator-nvim
    { 'numToStr/Navigator.nvim' },
    -- Github Copilot
    { 'github/copilot.vim' },
    { 'zbirenbaum/copilot.lua' },
    {
      "zbirenbaum/copilot-cmp",
      event = { 'InsertEnter', 'LspAttach' },
      fix_pairs = true,
      config = function()
        require("copilot_cmp").setup()
      end
    },
    -- Lspscage
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      dependencies = {
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
      }
    },
    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      -- load cmp on InsertEnter
      event = 'InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
  },
})
