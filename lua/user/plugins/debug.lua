return
{
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require('dap');
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

		vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {});
		vim.keymap.set('n', '<Leader>dc', dap.continue, {});

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--eval-command", "set print pretty on" }
		}

		dap.adapters.codelldb = {
			type = 'server',
			port = "13000",
			executable = {
				-- CHANGE THIS to your path!
				command = '/home/sanchit1053/.local/share/nvim/mason/bin/codelldb',
				args = { "--port", "13000" },
			},
			id = 'lldb',
		}

		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = "executable",
			command = "/home/sanchit1053/.local/share/nvim/mason/bin/OpenDebugAD7",
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Launch 3",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {}
			},
			{
				name = "Launch 2",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "cppdbg",
				request = "attach",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				pid = function()
					local name = vim.fn.input('Executable name (filter): ')
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = '${workspaceFolder}'
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'gdb',
				request = 'attach',
				target = 'localhost:1234',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}'
			},
		}


		dapui.setup();
	end

}
