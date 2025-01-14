return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require('mason-nvim-dap').setup({
				ensure_installed = { 'codelldb' },
				automatic_installation = true,
			})
		end
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require('dap')
			local widgets = require('dap.ui.widgets')
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			---------------------- codelldb ----------------------
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/codelldb"

			dap.adapters.codelldb = {
				type = 'server',
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				}
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
			----------------------  ----------------------

			vim.keymap.set('n', '<F5>', function() dap.continue() end)
			vim.keymap.set('n', '<F10>', function() dap.step_over() end)
			vim.keymap.set('n', '<F11>', function() dap.step_into() end)
			vim.keymap.set('n', '<F12>', function() dap.step_out() end)
			vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
			vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
			vim.keymap.set('n', '<Leader>lp',
				function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
			vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
			vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
			vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
				widgets.hover()
			end)
			vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
				widgets.preview()
			end)
			vim.keymap.set('n', '<Leader>df', function()
				widgets.centered_float(widgets.frames)
			end)
			vim.keymap.set('n', '<Leader>ds', function()
				widgets.centered_float(widgets.scopes)
			end)
		end
	}
}
