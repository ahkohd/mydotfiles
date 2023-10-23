-- luacheck: globals vim

local catppuccin_vim_mode_colors = function(colors)
    return {
      ["n"] = colors.blue,
      ["no"] = colors.pink,
      ["nov"] = colors.pink,
      ["noV"] = colors.pink,
      ["no"] = colors.pink,
      ["niI"] = colors.blue,
      ["niR"] = colors.blue,
      ["niV"] = colors.blue,
      ["v"] = colors.mauve,
      ["vs"] = colors.mauve,
      ["V"] = colors.lavender,
      ["Vs"] = colors.lavender,
      [""] = colors.yellow,
      ["s"] = colors.yellow,
      ["s"] = colors.teal,
      ["S"] = colors.teal,
      [""] = colors.yellow,
      ["i"] = colors.green,
      ["ic"] = colors.green,
      ["ix"] = colors.green,
      ["R"] = colors.flamingo,
      ["Rc"] = colors.flamingo,
      ["Rv"] = colors.rosewater,
      ["Rx"] = colors.flamingo,
      ["c"] = colors.peach,
      ["cv"] = colors.peach,
      ["ce"] = colors.peach,
      ["r"] = colors.teal,
      ["rm"] = colors.sky,
      ["r?"] = colors.maroon,
      ["!"] = colors.maroon,
      ["t"] = colors.red,
      ["nt"] = colors.red,
      ["null"] = colors.pink,
    }
end

local tokyo_night_dark_colors = function()
  local colors = {
    none = "NONE",
    bg = "#1a1b26",
    bg_dark = "#16161e",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#b4f9f8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
    git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
    gitSigns = {
      add = "#266d6a",
      change = "#536c9e",
      delete = "#b2555b",
    },
  }

  colors.crust = colors.bg
  colors.mantle = colors.bg_dark
  colors.surface2 = colors.fg_dark
  colors.mauve = colors.blue0
  colors.peach = colors.orange
  colors.sky = colors.blue5
  colors.sapphire = colors.blue6
  colors.subtext1 = colors.blue7
  colors.text = colors.fg
  colors.lavender = colors.purple

  return colors
end

local tokyo_night_dark_vim_mode_colors = function(colors)
  return {
    ["n"] = colors.blue,
    ["no"] = colors.magenta,
    ["nov"] = colors.magenta,
    ["noV"] = colors.magenta,
    ["no"] = colors.magenta,
    ["niI"] = colors.blue,
    ["niR"] = colors.blue,
    ["niV"] = colors.blue,
    ["v"] = colors.purple,
    ["vs"] = colors.purple,
    ["V"] = colors.blue1,
    ["Vs"] = colors.blue1,
    [""] = colors.yellow,
    ["s"] = colors.yellow,
    ["s"] = colors.teal,
    ["S"] = colors.teal,
    [""] = colors.yellow,
    ["i"] = colors.green,
    ["ic"] = colors.green,
    ["ix"] = colors.green,
    ["R"] = colors.red,
    ["Rc"] = colors.red,
    ["Rv"] = colors.orange,
    ["Rx"] = colors.red,
    ["c"] = colors.orange,
    ["cv"] = colors.orange,
    ["ce"] = colors.orange,
    ["r"] = colors.teal,
    ["rm"] = colors.green1,
    ["r?"] = colors.red1,
    ["!"] = colors.red1,
    ["t"] = colors.red,
    ["nt"] = colors.red,
    ["null"] = colors.magenta
  }
end

return {
  "rebelot/heirline.nvim",
  name = "heirline",
  event = "VeryLazy",
  config = function()
    local heirline = require("heirline")
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    -- local colors = require("catppuccin.palettes").get_palette()
    -- local VIMODE_COLORS = catppuccin_vim_mode_colors(colors)

    local colors = tokyo_night_dark_colors()
    local VIMODE_COLORS = tokyo_night_dark_vim_mode_colors(colors)

    conditions.buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end

    conditions.hide_in_width = function(size)
      return vim.api.nvim_get_option("columns") > (size or 140)
    end

    local Align = { provider = "%=", hl = { bg = colors.crust } }
    local Space = { provider = " " }


    local ViMode = {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      static = {
        mode_names = {
          ["n"] = "NORMAL",
          ["no"] = "OP",
          ["nov"] = "OP",
          ["noV"] = "OP",
          ["no"] = "OP",
          ["niI"] = "NORMAL",
          ["niR"] = "NORMAL",
          ["niV"] = "NORMAL",
          ["v"] = "VISUAL",
          ["vs"] = "VISUAL",
          ["V"] = "LINES",
          ["Vs"] = "LINES",
          [""] = "BLOCK",
          ["s"] = "BLOCK",
          ["s"] = "SELECT",
          ["S"] = "SELECT",
          [""] = "BLOCK",
          ["i"] = "INSERT",
          ["ic"] = "INSERT",
          ["ix"] = "INSERT",
          ["R"] = "REPLACE",
          ["Rc"] = "REPLACE",
          ["Rv"] = "V-REPLACE",
          ["Rx"] = "REPLACE",
          ["c"] = "COMMAND",
          ["cv"] = "COMMAND",
          ["ce"] = "COMMAND",
          ["r"] = "ENTER",
          ["rm"] = "MORE",
          ["r?"] = "CONFIRM",
          ["!"] = "SHELL",
          ["t"] = "TERM",
          ["nt"] = "TERM",
          ["null"] = "NONE",
        },
      },
      provider = function(self)
        return string.format(" %s ", self.mode_names[self.mode])
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = VIMODE_COLORS[mode], bg = colors.mantle, bold = true }
      end,
      update = {
        "ModeChanged",
      },
    }

    local ViModeSepLeft = {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      provider = "▍",
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = VIMODE_COLORS[mode], bg = colors.mantle }
      end,
      update = {
        "ModeChanged",
      },
    }

    local ViModeSepRight = {
      init = function(self)
        self.mode = vim.api.nvim_get_mode().mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = "redrawstatus",
          })
          self.once = true
        end
      end,
      provider = "▐",
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = VIMODE_COLORS[mode], bg = colors.mantle }
      end,
      update = {
        "ModeChanged",
      },
    }

    local ViModeArrow = {
      -- provider = "",
      hl = { fg = colors.mantle, bg = colors.crust },
    }

    local FileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      condition = conditions.buffer_not_empty,
      hl = { bg = colors.crust, fg = colors.subtext1 },
    }

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
          vim.fn.fnamemodify(filename, ":t"),
          extension,
          { default = true }
        )
      end,
      provider = function(self)
        return self.icon and (" " .. self.icon .. " ")
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end,
    }

    local FileName = {
      provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":~:.")
        if filename == "" then
          return "[No Name]"
        end
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = { fg = colors.subtext1, bold = false },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = " ● ",
        hl = { fg = colors.lavender },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = "",
        hl = { fg = colors.red },
      },
    }

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          return { fg = colors.subtext1, bold = false, force = false }
        end
      end,
    }

    FileNameBlock = utils.insert(
      FileNameBlock,
      FileIcon,
      utils.insert(FileNameModifer, FileName),
      unpack(FileFlags),
      { provider = "%< " }
    )

    local FileType = {
      provider = function()
        return " " .. string.upper(vim.bo.filetype) .. " "
      end,
      hl = { bg = colors.crust, fg = colors.subtext1 },
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
    }

    local FileSize = {
      provider = function()
        local suffix = { "b", "k", "M", "G", "T", "P", "E" }
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize < 1024 then
          return " " .. fsize .. suffix[1] .. " "
        end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format(" %.2g%s ", fsize / math.pow(1024, i), suffix[i + 1])
      end,
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
      hl = { bg = colors.crust, fg = colors.subtext1 },
    }

    local Ruler = {
      provider = " %7(%l/%3L%):%2c %P ",
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
      hl = { bg = colors.crust, fg = colors.subtext1 },
    }

    local LSPActive = {
      condition = function()
        return conditions.hide_in_width(120) and conditions.lsp_attached()
      end,
      update = { "LspAttach", "LspDetach" },
      provider = function()
        local names = {}
        local client_icons = {
          copilot = " ",
          lua_ls = "󰢱 Lua ",
          rust_analyzer = "󱘗 Rust ",
        }
        for _, server in pairs(vim.lsp.get_active_clients()) do
          if server.name ~= "null-ls" then
            if client_icons[server.name] then
              table.insert(names, client_icons[server.name])
            else
              table.insert(names, server.name)
            end
          end
        end
        return " " .. table.concat(names, " ") .. " "
      end,
      hl = { bg = colors.crust, fg = colors.subtext1, bold = false, italic = false },
    }

    local Diagnostics = {
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width() and conditions.has_diagnostics()
      end,
      static = {
        error_icon = " ",
        warn_icon = " ",
        info_icon = " ",
        hint_icon = " ",
      },
      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,
      update = { "DiagnosticChanged", "BufEnter" },
      hl = { bg = colors.crust },
      Space,
      {
        provider = function(self)
          return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.red },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.yellow },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.sapphire },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.sky },
      },
      Space,
    }

    local head_cache = {}

    local function get_git_detached_head()
      local git_branches_file = io.popen("git branch -a --no-abbrev --contains", "r")
      if not git_branches_file then
        return
      end
      local git_branches_data = git_branches_file:read("*l")
      io.close(git_branches_file)
      if not git_branches_data then
        return
      end

      local branch_name = git_branches_data:match(".*HEAD (detached %w+ [%w/-]+)")
      if branch_name and string.len(branch_name) > 0 then
        return branch_name
      end
    end

    local function parent_pathname(path)
      local i = path:find("[\\/:][^\\/:]*$")
      if not i then
        return
      end
      return path:sub(1, i - 1)
    end

    local function get_git_dir(path)
      local function has_git_dir(dir)
        local git_dir = dir .. "/.git"
        if vim.fn.isdirectory(git_dir) == 1 then
          return git_dir
        end
      end

      local function has_git_file(dir)
        local gitfile = io.open(dir .. "/.git")
        if gitfile ~= nil then
          local git_dir = gitfile:read():match("gitdir: (.*)")
          gitfile:close()

          return git_dir
        end
      end

      local function is_path_absolute(dir)
        local patterns = {
          "^/",
          "^%a:[/\\]",
        }
        for _, pattern in ipairs(patterns) do
          if string.find(dir, pattern) then
            return true
          end
        end
        return false
      end

      if not path or path == "." then
        path = vim.fn.getcwd()
      end

      local git_dir
      while path do
        git_dir = has_git_dir(path) or has_git_file(path)
        if git_dir ~= nil then
          break
        end
        path = parent_pathname(path)
      end

      if not git_dir then
        return
      end

      if is_path_absolute(git_dir) then
        return git_dir
      end
      return path .. "/" .. git_dir
    end

    local Git = {
      condition = function()
        return conditions.buffer_not_empty() and conditions.is_git_repo()
      end,
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
      end,
      hl = { bg = colors.mantle, fg = colors.mauve },
      Space,
      {
        provider = function()
          if vim.bo.filetype == "help" then
            return
          end
          local current_file = vim.fn.expand("%:p")
          local current_dir

          if vim.fn.getftype(current_file) == "link" then
            local real_file = vim.fn.resolve(current_file)
            current_dir = vim.fn.fnamemodify(real_file, ":h")
          else
            current_dir = vim.fn.expand("%:p:h")
          end

          local git_dir = get_git_dir(current_dir)
          if not git_dir then
            return
          end

          local git_root = git_dir:gsub("/.git/?$", "")
          local head_stat = vim.loop.fs_stat(git_dir .. "/HEAD")

          if head_stat and head_stat.mtime then
            if
                head_cache[git_root]
                and head_cache[git_root].mtime == head_stat.mtime.sec
                and head_cache[git_root].branch
            then
              return " " .. head_cache[git_root].branch
            else
              local head_file = vim.loop.fs_open(git_dir .. "/HEAD", "r", 438)
              if not head_file then
                return
              end
              local head_data = vim.loop.fs_read(head_file, head_stat.size, 0)
              if not head_data then
                return
              end
              vim.loop.fs_close(head_file)

              head_cache[git_root] = {
                head = head_data,
                mtime = head_stat.mtime.sec,
              }
            end
          else
            return
          end

          local branch_name = head_cache[git_root].head:match("ref: refs/heads/([^\n\r%s]+)")
          if not branch_name then
            branch_name = get_git_detached_head()
            if not branch_name then
              head_cache[git_root].branch = ""
              return
            end
          end

          head_cache[git_root].branch = branch_name
          return " " .. branch_name
        end,
        hl = { bold = false },
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("  " .. count)
        end,
        hl = { fg = colors.green },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("  " .. count)
        end,
        hl = { fg = colors.red },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("  " .. count)
        end,
        hl = { fg = colors.peach },
      },
      Space,
    }

    local GitArrow = {
      provider = "",
      hl = { fg = colors.mantle, bg = colors.crust },
      condition = function()
        return conditions.buffer_not_empty() and conditions.is_git_repo()
      end,
    }

    local FileEncoding = {
      provider = function()
        local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
        return " " .. enc:upper() .. " "
      end,
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
      hl = { bg = colors.crust, fg = colors.subtext1 },
    }

    local FileFormat = {
      provider = function()
        local fmt = vim.bo.fileformat
        if fmt == "unix" then
          return " LF "
        elseif fmt == "mac" then
          return " CR "
        else
          return " CRLF "
        end
      end,
      hl = { bg = colors.crust, fg = colors.subtext1 },
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
    }

    local IndentSizes = {
      provider = function()
        local indent_type = vim.api.nvim_buf_get_option(0, "expandtab") and "Spaces" or "Tab Size"
        local indent_size = vim.api.nvim_buf_get_option(0, "tabstop")
        return (" %s: %s "):format(indent_type, indent_size)
      end,
      hl = { bg = colors.crust, fg = colors.subtext1 },
      condition = function()
        return conditions.buffer_not_empty() and conditions.hide_in_width()
      end,
    }

    local StatusLine = {
      ViModeSepLeft,
      ViMode,
      ViModeArrow,
      FileNameBlock,
      FileType,
      FileSize,
      Ruler,
      Align,
      LSPActive,
      Diagnostics,
      FileEncoding,
      FileFormat,
      IndentSizes,
      GitArrow,
      Git,
      ViModeSepRight,
    }

    heirline.setup({ statusline = StatusLine })
  end,
}
