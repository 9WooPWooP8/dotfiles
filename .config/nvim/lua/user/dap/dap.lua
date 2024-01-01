local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

vim.keymap.set('n', '<leader>dr', dap.continue)
vim.keymap.set('n', '<leader>dj', dap.step_into)
vim.keymap.set('n', '<leader>dl', dap.step_over)
vim.keymap.set('n', '<leader>dk', dap.step_out)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>ds', dap.terminate)


--Autostart ui when debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
