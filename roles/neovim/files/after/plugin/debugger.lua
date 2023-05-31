local nnoremap = require("mert.keymap").nnoremap

-- keymaps
nnoremap("<F5>", ":lua require'dap'.continue()<CR>")
nnoremap("<F10>", ":lua require'dap'.step_over()<CR>")
nnoremap("<F11>", ":lua require'dap'.step_into()<CR>")
nnoremap("<F12>", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>")

-- virutal text
require("nvim-dap-virtual-text").setup()

-- cpp adapter
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/mert/vs-extention/extension/debugAdapters/bin/OpenDebugAD7',
}

local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- go
require('dap-go').setup()
nnoremap("<leader>dt", ":lua require('dap-go').debug_test()<CR>")

-- dap up
require('dapui').setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
