return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<leader>ds", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<leader>di", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<leader>do", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()
			require("dap-go").setup()
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
			dap.configurations.java = {
				{
					name = "Debug Launch 2GB",
					type = "java",
					request = "launch",
					vmArgs = "" .. "-Xmx2g ",
				},
				{
					name = "Debug Attach (8000)",
					type = "java",
					request = "attach",
					hostName = "127.0.0.1",
					port = 8000,
				},
				{
					name = "Debug Attach (5005)",
					type = "java",
					request = "attach",
					hostName = "127.0.0.1",
					port = 5005,
				},
			}
		end,
	},
	{
		-- you need to install delve first
		"leoluz/nvim-dap-go",
	},
}
