local dap = require('dap')
local dapui = require('dapui')
local daptext = require('nvim-dap-virtual-text')

vim.keymap.set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Up>", dap.continue)
vim.keymap.set("n", "<C-Up>", dap.terminate)
vim.keymap.set("n", "<Down>", dap.step_over)
vim.keymap.set("n", "<Right>", dap.step_into)
vim.keymap.set("n", "<Left>", dap.step_out)
vim.keymap.set("n", "<C-Left>", dap.step_back)

daptext.setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.lfdbg = function(callback, config)
  print('Starting state machine ' .. config.statemachine)
  callback {
    type = 'executable',
    command = '/home/loib_st/dev/ride-cli/dist-newstyle/build/x86_64-linux/ghc-9.2.8/ride-cli-0.9.1/x/ride/noopt/build/ride/ride',
    args = { 'execution', 'debug', config.statemachine, '-i' }
  }
end

dap.configurations.lf = {
  {
    name = 'Launch and debug current file',
    type = 'lfdbg',
    request = 'launch',
    statemachine = function()
      return vim.fn.expand('%:t:r')
    end,
  },
  {
    name = 'Launch and debug a statemachine',
    type = 'lfdbg',
    request = 'launch',
    statemachine = function()
      return vim.fn.input('Name of statemachine to debug: ')
    end,
  }
}

---- Go
--require('dap-go').setup()
--
---- C++
--dap.adapters.cppdbg = {
--  id = 'cppdbg',
--  type = 'executable',
--  command = '/home/loib_st/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
--}
--
--dap.configurations.cpp = {
--  {
--    name = 'Launch file',
--    type = 'cppdbg',
--    request = 'launch',
--    program = function()
--        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--    end,
--    cwd = '${workspaceFolder}',
--    stopOnEntry = true,
--  },
--  {
--    name = 'Attach to gdbserver :1234',
--    type = 'cppdbg',
--    request = 'launch',
--    MIMode = 'gdb',
--    miDebuggerServerAddress = 'localhost:1234',
--    miDebuggerPath = '/usr/bin/gdb',
--    cwd = '${workspaceFolder}',
--    program = function()
--      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--    end,
--  },
--}
