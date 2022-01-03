local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- local lua_path = function(name)
--     return string.format("require'%s'", name)
--   end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  -- use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "mbbill/undotree"
  use "ThePrimeagen/harpoon"
  use "tpope/vim-eunuch"
  use "ap/vim-css-color"
  use "mattn/emmet-vim"
    use {'prettier/vim-prettier', run = 'yarn install' }
    use {
  'sudormrfbin/cheatsheet.nvim',

  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }
}
    use 'dbeniamine/cheat.sh-vim'

  --no distractions mode
  use "junegunn/goyo.vim"
    use "othree/javascript-libraries-syntax.vim"
use {'pwntester/octo.nvim', config=function()
  require"octo".setup()
end}

    --webdev shit
    use "lukas-reineke/cmp-rg"
    use "ray-x/cmp-treesitter"
    use "tpope/vim-rails"
    use "tpope/vim-endwise"
    use "tpope/vim-rvm"
    use "tpope/vim-dadbod"
    use "tpope/vim-jdaddy"
    use "vim-test/vim-test"
    use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
    use "preservim/tagbar"

    use 'ggandor/lightspeed.nvim'

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  -- use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use "morhetz/gruvbox"
  use "luisiacc/gruvbox-baby"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "tpope/vim-fugitive"

  use { 'onsails/lspkind-nvim'}
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  -- Autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs'}
  use { 'AndrewRadev/tagalong.vim' }
  use { 'andymass/vim-matchup' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter'}
  use { 'p00f/nvim-ts-rainbow'}
  use { 'lukas-reineke/indent-blankline.nvim'}
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'romgrk/nvim-treesitter-context' }
  use { 'SmiteshP/nvim-gps'}

  -- Syntax
  use { 'moll/vim-node' }
  use { 'editorconfig/editorconfig-vim'}
  use { 'chrisbra/csv.vim' }
  use { 'npxbr/glow.nvim' }
  use { 'junegunn/vim-easy-align' }
  use { 'mhartington/formatter.nvim'}
  use { 'zdharma-continuum/zinit-vim-syntax' }
  use { 'rust-lang/rust.vim' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'famiu/feline.nvim'}
  -- use { 'romgrk/barbar.nvim' }

  -- Telescope
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim'}
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'nvim-telescope/telescope-project.nvim' }

  --missing
  use { 'luukvbaal/stabilize.nvim'}
  use { 'glepnir/galaxyline.nvim'}
  use { 'folke/todo-comments.nvim' }

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua'}

  -- Color
  use { 'crivotz/nvim-colorizer.lua'}
  use { 'lpinilla/vim-codepainter' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use { 'kdheepak/lazygit.nvim' }
  use { 'rhysd/committia.vim' }

  -- Registers & clipboard
  use { 'tversteeg/registers.nvim' }
  use { 'AckslD/nvim-neoclip.lua'}

  -- Move & Search & replace
  use { 'nacro90/numb.nvim'}
  use { 'dyng/ctrlsf.vim'}
  use { 'kevinhwang91/nvim-hlslens'}
  use { 'ggandor/lightspeed.nvim'}
  use { 'chentau/marks.nvim'}
  use { 'karb94/neoscroll.nvim'}
  use { 'dstein64/nvim-scrollview' }
  use { 'chaoren/vim-wordmotion' }
  use { 'fedepujol/move.nvim' }

  -- Tim Pope docet
  use { 'tpope/vim-sensible' }
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-capslock' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-rvm' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-jdaddy' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  use { 'github/copilot.vim'}

  -- Tmux
  -- use { 'christoomey/vim-tmux-navigator' }

  -- Colorschema
  use { 'sainnhe/gruvbox-material' }

  -- Tags
  use { 'ludovicchabant/vim-gutentags'}

  -- General Plugins
  use { 'rcarriga/nvim-notify'}
  use { 'airblade/vim-rooter'}
  use { 'mhinz/vim-startify' }
  use { 'goolord/alpha-nvim'}
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use { 'lambdalisue/suda.vim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
