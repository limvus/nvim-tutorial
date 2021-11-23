local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd(
  [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

return require('packer').startup(function(use)
    -- Packer itself
    use "wbthomason/packer.nvim"

    -- Theme
    use "kyazdani42/nvim-web-devicons"
    use "Mofiqul/dracula.nvim"
    use "morhetz/gruvbox"
    use "nvim-lualine/lualine.nvim"

    -- Start Screen
    use "mhinz/vim-startify"

    -- Explorer
    use "kyazdani42/nvim-tree.lua"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use "nvim-telescope/telescope-project.nvim"
    use "ggandor/lightspeed.nvim"
    use "karb94/neoscroll.nvim"
    use "kevinhwang91/nvim-bqf"
    use "mhinz/vim-grepper"
    use "andymass/vim-matchup"
    use "markstory/vim-zoomwin"
    use "jeffkreeftmeijer/vim-numbertoggle"
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end
    }



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
