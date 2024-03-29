return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", 
  },
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = 'open_current'
			}
		})
		
		vim.keymap.set('n', '<C-b>', ":Neotree  filesystem reveal left toggle<CR>", {})
	end
}
