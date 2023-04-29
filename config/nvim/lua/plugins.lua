vim.cmd [[packadd packer.nvim]]

-- check if packer is installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init { display = {
    open_fn = function()
        return require("packer.util").float { border = "rounded" }
    end,
},}

return packer.startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Ayu Dark colourscheme
    use ({
        "Shatur/neovim-ayu",
        config = function()
            vim.cmd("colorscheme ayu-dark")
        end
    })

    -- Icons
    use "kyazdani42/nvim-web-devicons"

    -- Lualine
    use ({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })
   
    -- Plenary
    use "nvim-lua/plenary.nvim"

    -- Telescope
    use ({
        "nvim-telescope/telescope.nvim", 
        tag = "0.1.1",
        requires =  {'nvim-lua/plenary.nvim'}
    })

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    require("telescope").load_extension "file_browser"


    -- Telescope plugins
    use "mrjones2014/nvim-ts-rainbow"

    -- COC
    use ({ 
        "neoclide/coc.nvim", 
        branch = "release" 
    })
    
    -- Tressitter
    use({
        "nvim-treesitter/nvim-treesitter",  
        run = {":TSUpdate"}
    })

    -- Harpoon
    use "ThePrimeagen/harpoon"

    -- Undo Tree 
    use "mbbill/undotree"

    -- Better Autoclose  
    use "Raimondi/delimitMate"

    -- Better Formatter 
    use "mhartington/formatter.nvim"
    
    -- Popup commands 
    use "gelguy/wilder.nvim"
    
    -- Startup menu
    use ({
        "goolord/alpha-nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
    })

    -- Better commenting
    use "tpope/vim-commentary"

end)
