local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	print("aaaaa")
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	print("fasdfasdfasdfasdf")
	return
end


dap.adapters.coreclr = {
	type = 'executable',
	command = '/home/nikita/.local/share/nvim/mason/bin/netcoredbg',
	args = { '--interpreter=vscode' }
}

vim.g.dotnet_build_project = function()
	local default_path = vim.fn.getcwd() .. '/'
	if vim.g['dotnet_last_proj_path'] ~= nil then
		default_path = vim.g['dotnet_last_proj_path']
	end
	local path = vim.fn.input('Path to your *proj file', default_path, 'file')
	vim.g['dotnet_last_proj_path'] = path
	local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
	print('')
	print('Cmd to execute: ' .. cmd)
	local f = os.execute(cmd)
	if f == 0 then
		print('\nBuild: ✔️ ')
	else
		print('\nBuild: ❌ (code: ' .. f .. ')')
	end
end

vim.g.dotnet_get_dll_path = function()
	local request = function()
		return vim.fn.input('Path to dll', vim.fn.getcwd(), 'file')
	end

	if vim.g['dotnet_last_dll_path'] == nil then
		vim.g['dotnet_last_dll_path'] = request()
	else
		if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
			vim.g['dotnet_last_dll_path'] = request()
		end
	end

	return vim.g['dotnet_last_dll_path']
end

local config = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		-- console = "integratedTerminal",
		cwd = "${workspaceFolder}/src/ClientService.AspNet",
		launchSettingsFilePath = "${workspaceFolder}/src/ClientService.AspNet/Properties/launchSettings.json",
		launchSettingsProfile = "ClientService.AspNet",
		program = function()
			if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
				vim.g.dotnet_build_project()
			end
			return vim.g.dotnet_get_dll_path()
		end,
	},
}

dap.configurations.cs = config

--Autostart ui when debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end
