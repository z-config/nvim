return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup({
			theme = 'hyper',
			shortcut_type = "letter",
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			config = {
				header = {

					[[                                           ]],
					[[                                           ]],
					[[                                           ]],
					[[                                           ]],
					[[         ,----,                            ]],
					[[       .'   .`|                            ]],
					[[    .'   .'   ;                            ]],
					[[  ,---, '    .'          __  ,-.   ,---.   ]],
					[[  |   :     ./         ,' ,'/ /|  '   ,'\  ]],
					[[  ;   | .'  /   ,---.  '  | |' | /   /   | ]],
					[[  `---' /  ;   /     \ |  |   ,'.   ; ,. : ]],
					[[    /  ;  /   /    /  |'  :  /  '   | |: : ]],
					[[   ;  /  /--,.    ' / ||  | '   '   | .; : ]],
					[[  /  /  / .`|'   ;   /|;  : |   |   :    | ]],
					[[./__;       :'   |  / ||  , ;    \   \  /  ]],
					[[|   :     .' |   :    | ---'      `----'   ]],
					[[;   |  .'     \   \  /                     ]],
					[[`---'          `----'                      ]],
					[[                                           ]],
					[[                                           ]],
					[[                                           ]],
					[[                                           ]],
				},
				shortcut = {
					{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Lazy',
						group = 'DiagnosticHint',
						action = 'Lazy',
						key = 'l',
					},
					{
						desc = ' quit',
						group = 'Number',
						action = 'qa',
						key = 'q',
					},
				},
				footer = {} --your footer
			}
		})
	end,
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
