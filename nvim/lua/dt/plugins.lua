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
    git = {
        clone_timeout = 300,
    },
}

-- Install your plugins here
return packer.startup(function(use)

    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "goolord/alpha-nvim" -- Nvim greeter
    use "akinsho/toggleterm.nvim" --terminal overlay
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use 'norcalli/nvim-colorizer.lua'
    use "lewis6991/impatient.nvim"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight ???
    -- Catppuccin colorscheme
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })

    -- -- One Dark colorscheme
    -- use 'navarasu/onedark.nvim'
    -- Status line
    use "nvim-lualine/lualine.nvim"
    -- cmp plug
    use "hrsh7th/nvim-cmp" -- The cmp plugin
    use "hrsh7th/cmp-buffer" -- Buffer completion
    use "hrsh7th/cmp-path" -- Path completion
    use "hrsh7th/cmp-cmdline" -- Comand completion
    use "saadparwaiz1/cmp_luasnip" -- Snippets completion
    use "hrsh7th/cmp-nvim-lsp" -- LSP completion
    use "hrsh7th/cmp-nvim-lua" -- Lua completion

    -- snippets
    use "L3MON4D3/LuaSnip" -- Snippets engine
    use "rafamadriz/friendly-snippets" -- Snippets

    use "neovim/nvim-lspconfig" --enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server isntaller
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Markdown VimWiki
    use "vimwiki/vimwiki"

    -- Barbar
  --
    use "romgrk/barbar.nvim"

    -- Easymotion
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use 'karb94/neoscroll.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
