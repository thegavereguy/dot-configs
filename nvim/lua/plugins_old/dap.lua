local dap = require('dap')
local dapui = require('dapui')

dap.adapters.codelldb = {
	type = 'server',
  port = "${port}",
  executable = {

    command = '/home/enrico/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},

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

dapui.setup({
  layouts = { {
    elements = { {
      id = "scopes",
      size = 0.50
    }, {
      id = "breakpoints",
      size = 0.25
    }, {
      id = "stacks",
      size = 0.25
    },
	},
    position = "left",
    size = 40
  }, {
    elements = { {
      id = "console",
      size = 1
    } },
    position = "bottom",
    size = 20
  } },
})
