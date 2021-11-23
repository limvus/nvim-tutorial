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

  use {
        'kyazdani42/nvim-tree.lua',
        config = function() require'nvim-tree'.setup {} end
    }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
