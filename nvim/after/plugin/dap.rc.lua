local dap = require("dap")

-- ADAPTERS
-- ******************************

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/developer/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.adapters.yarn = {
  type = "executable",
  command = "yarn",
  args = {
    "node",
    os.getenv("HOME") .. "/developer/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
  },
}

dap.adapters.lldb = {
  type = "executable",
  command = "/Users/victoraremu/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/adapter/codelldb",
  name = "lldb",
}

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/Users/victoraremu/.vscode/extensions/ms-vscode.cpptools-1.12.4-darwin-arm64/debugAdapters/bin/OpenDebugAD7",
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {
    os.getenv("HOME") .. "/developer/microsoft/vscode-chrome-debug/out/src/chromeDebug.js",
  },
}

dap.adapters.firefox = {
  type = "executable",
  command = "node",
  args = {
    os.getenv("HOME") .. "/developer/mozilla/vscode-firefox-debug/dist/adapter.bundle.js",
  },
}

dap.adapters.yarn_firefox = {
  type = "executable",
  command = "yarn",
  args = {
    "node",
    os.getenv("HOME") .. "/developer/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
  },
}

-- LAUNCHERS
-- ******************************

local nodejs = {
  name = "Launch (Node.JS)",
  type = "node2",
  request = "launch",
  program = "${file}",
  cwd = vim.fn.getcwd(),
  sourceMaps = true,
  protocol = "inspector",
  console = "integratedTerminal",
}

local nodejs_attach = {
  -- For this to work you need to make sure the node process is started with the `--inspect` flag.
  name = "Attach to process (Node.JS)",
  type = "node2",
  request = "attach",
  processId = require("dap.utils").pick_process,
}

local lldb = {
  name = "Launch (LLDB - C/C++/Rust)",
  type = "lldb",
  request = "launch",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
  args = {},
  stopOnEntry = false,

  -- 💀
  -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
  --
  --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
  --
  -- Otherwise you might get the following error:
  --
  --    Error on launch: Failed to attach to the target process
  --
  -- But you should be aware of the implications:
  -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
  runInTerminal = false,
}

local cpptools = {
  name = "Launch (cpp dbg - C/C++/Rust)",
  type = "cppdbg",
  request = "launch",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
  stopAtEntry = true,
  miDebuggerPath = "/Users/victoraremu/.vscode/extensions/ms-vscode.cpptools-1.12.4-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi",
}

local cpptools_attach = {
  name = "Attach to gdbserver :1234",
  type = "cppdbg",
  request = "launch",
  MIMode = "gdb",
  miDebuggerServerAddress = "localhost:1234",
  miDebuggerPath = "/Users/victoraremu/.vscode/extensions/ms-vscode.cpptools-1.12.4-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi",
  cwd = "${workspaceFolder}",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
}

local firefox = {
  name = "Launch with Firefox",
  type = "firefox",
  request = "launch",
  reAttach = true,
  sourceMaps = true,
  url = "http://localhost:3000",
  webRoot = "${workspaceFolder}",
  firefoxExecutable = "/Applications/Firefox\\ Developer\\ Edition.app/Contents/MacOS/firefox",
}

local chrome_attach = {
  name = "Attach to Chrome",
  type = "chrome",
  request = "attach",
  program = "${file}",
  cwd = vim.fn.getcwd(),
  port = 9222,
  protocol = "inspector",
  sourceMaps = true,
  webRoot = "${workspaceFolder}",
}

local tauri_dev = {
  type = "cppdbg",
  request = "launch",
  name = "Tauri Development Debug",
  args = {
    "cargo",
    "build",
    "--manifest-path=./src-tauri/Cargo.toml",
    "--no-default-features",
  },
  miDebuggerPath = "/Users/victoraremu/.vscode/extensions/ms-vscode.cpptools-1.12.4-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi",
  program = "${workspaceFolder}/src-tauri/target/debug/app",
  cwd = "${workspaceFolder}",
  stopOnEntry = true,
  runInTerminal = false,
  targetArchitecture = "arm",
}

local tauri_prod = {
  type = "cppdbg",
  request = "launch",
  name = "Tauri Production Debug",
  args = {
    "cargo",
    "build",
    "--release",
    "--manifest-path=./src-tauri/Cargo.toml",
  },
  miDebuggerPath = "/Users/victoraremu/.vscode/extensions/ms-vscode.cpptools-1.12.4-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi",
  program = function()
    local path = "${workspaceFolder}/src-tauri/target/"
    local os_name, arch_name = GetOS()
    local target

    if os_name == "Mac" then
      target = "apple-darwin"
    end

    if arch_name == "x86_64" then
      target = arch_name .. "-" .. target
    end

    if arch_name == "arm" then
      target = "aarch64-" .. target
    end

    local name = vim.fn.input("program name? (app, app.exe, etc): ")
    path = path .. target .. "/release/" .. name

    return path
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = true,
  runInTerminal = false,
}

-- CONFIGURATIONS
-- ******************************

dap.configurations.javascript = {
  nodejs,
  nodejs_attach,
  firefox,
}

dap.configurations.typescript = dap.configurations.javascript

dap.configurations.javascriptreact = {
  chrome_attach,
  firefox,
  nodejs,
  nodejs_attach,
}

dap.configurations.typescriptreact = dap.configurations.javascriptreact

dap.configurations.c = {
  lldb,
  cpptools,
  cpptools_attach,
}

dap.configurations.cpp = dap.configurations.c

dap.configurations.rust = {
  lldb,
  tauri_dev,
  tauri_prod,
  cpptools,
  cpptools_attach,
}

-- NVIM DAP INTEGRATIONS SETUP
-- ****************************************

vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⛔️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

require("dap").set_log_level("DEBUG")

-- telescope-dap
require("telescope").load_extension("dap")

-- nvim dap ui virtual text
require("nvim-dap-virtual-text").setup({})

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  },
})

local Hydra = require("hydra")

-- debug submode setup with Hydra
local hint = [[
 🐞🔫 DEBUGGER MENU

 _c_: Continue   _l_: Step over   _j_: Step into   _k_: Step out _C_: Stop
 _b_: Toggle breakpoint   _u_: Toggle debugger UI  _v_: Eval expression (under cursor or visual selection)
 _h_: Inspect/hover _s_: Current scope _,_: Go up call stack _._: Go down call stack
 _r_: Add a break point condition?   _p_: Add a log point message?   _o_: Open REPL
 _q_: REPL run last    _d_: Show commands   _g_: Show configurations
 _x_: List breakpoints   _z_: List variables   _e_: List frames
 _a_: (Rust) Hover actions   _t_: (Rust) Code action group

 _<Esc>_: Exit debug mode _m_: Launch Chrome in remote debugging mode
]]

Hydra({
  hint = hint,
  name = "Debugger",
  config = {
    color = "pink",
    invoke_on_body = true,
    hint = {
      position = "bottom",
      border = "rounded",
    },
  },
  mode = { "n", "x" },
  body = "<leader>d",
  heads = {
    { "c", '<cmd>lua require"dap".continue()<CR>' },
    { "l", '<cmd>lua require"dap".step_over()<CR>' },
    { "j", '<cmd>lua require"dap".step_into()<CR>' },
    { "k", '<cmd>lua require"dap".step_out()<CR>' },
    { "C", '<cmd>lua require"dap".close()<CR>', { exit = true } },
    { "b", '<cmd>lua require"dap".toggle_breakpoint()<CR>' },
    { "h", '<cmd>lua require"dap.ui.widgets".hover()<CR>', { exit = true } },
    {
      "s",
      '<cmd>lua local widgets = require"dap.ui.widgets"; widgets.centered_float(widgets.scopes)<CR>',
      { exit = true },
    },
    { ",", '<cmd>lua require"dap".up()<CR>' },
    { ".", '<cmd>lua require"dap".down()<CR>' },
    { "u", '<cmd>lua require"dapui".toggle()<CR>' },
    { "v", '<cmd>lua require"dapui".eval()<CR>' },
    { "r", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { exit = true } },
    {
      "p",
      '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      { exit = true },
    },
    { "o", '<cmd>lua require"dap".repl.open()<CR>', { exit = true } },
    { "q", '<cmd>lua require"dap".repl.run_last()<CR>', { exit = true } },
    { "d", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>' },
    { "g", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>' },
    { "x", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>' },
    { "z", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>' },
    { "e", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>' },
    { "a", "<cmd>:RustHoverActions<CR>", { exit = true } },
    { "t", "<cmd>:RustCodeAction<CR>", { exit = true } },
    { "m", "<cmd>lua Launch_chrome_remote_debug()<CR>", { exit = true } },
    { "<Esc>", nil, { exit = true } },
  },
})

function Launch_chrome_remote_debug()
  print("[info]: Launching Chrome in remote debug mode...")
  local url = vim.fn.input("Enter url: ")
  vim.loop.spawn("open", {
    args = {
      "-b",
      "com.brave.Browser",
      "--args",
      "--remote-debugging-port",
      "9222",
      "--user-data-dir",
      "remote-profile",
      url,
    },
  })
end

function GetOS()
  local raw_os_name, raw_arch_name = "", ""

  -- LuaJIT shortcut
  if jit and jit.os and jit.arch then
    raw_os_name = jit.os
    raw_arch_name = jit.arch
  else
    -- is popen supported?
    local popen_status, popen_result = pcall(io.popen, "")
    if popen_status then
      popen_result:close()
      -- Unix-based OS
      raw_os_name = io.popen("uname -s", "r"):read("*l")
      raw_arch_name = io.popen("uname -m", "r"):read("*l")
    else
      -- Windows
      local env_OS = os.getenv("OS")
      local env_ARCH = os.getenv("PROCESSOR_ARCHITECTURE")
      if env_OS and env_ARCH then
        raw_os_name, raw_arch_name = env_OS, env_ARCH
      end
    end
  end

  raw_os_name = (raw_os_name):lower()
  raw_arch_name = (raw_arch_name):lower()

  local os_patterns = {
    ["windows"] = "Windows",
    ["linux"] = "Linux",
    ["mac"] = "Mac",
    ["osx"] = "Mac",
    ["darwin"] = "Mac",
    ["^mingw"] = "Windows",
    ["^cygwin"] = "Windows",
    ["bsd$"] = "BSD",
    ["SunOS"] = "Solaris",
  }

  local arch_patterns = {
    ["^x86$"] = "x86",
    ["i[%d]86"] = "x86",
    ["amd64"] = "x86_64",
    ["x86_64"] = "x86_64",
    ["Power Macintosh"] = "powerpc",
    ["^arm"] = "arm",
    ["^mips"] = "mips",
  }

  local os_name, arch_name = "unknown", "unknown"

  for pattern, name in pairs(os_patterns) do
    if raw_os_name:match(pattern) then
      os_name = name
      break
    end
  end
  for pattern, name in pairs(arch_patterns) do
    if raw_arch_name:match(pattern) then
      arch_name = name
      break
    end
  end
  return os_name, arch_name
end
