return {
  {
    "folke/snacks.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        event = "VeryLazy",
        opts = {
          hint = "floating-big-letter",
          show_prompt = false,
          filter_rules = {
            autoselect_one = true,
            include_current_win = false,
            include_unfocusable_windows = false,
            -- stylua: ignore
            bo = {
              filetype = { "snacks_picker_input", "snacks_picker_list", "NvimTree", "neo-tree", "notify", "snacks_notif", },
              buftype = { "terminal", "nofile", "quickfix", "help", "prompt", "notify", "float" },
            },
          },
        },
      },
    },
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        sections = {
          { section = "header" },
          -- {
          --   section = "terminal",
          --   cmd = "figlet -d /usr/share/figlet/ -f Twisted neovim | lolcat",
          --   random = 10,
          --   height = 12,
          --   indent = 0,
          --   -- padding = 1,
          -- },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      picker = {
        enabled = true,
        ui_select = true,
        sources = {
          explorer = {
            actions = {
              window_picker = function(_, item)
                if item.dir then
                  return
                end

                local window_id = require("window-picker").pick_window()

                if not window_id then
                  return
                end

                vim.api.nvim_set_current_win(window_id)
                vim.cmd("edit " .. item._path)
                -- Snacks.explorer()
              end,
            },
            win = {
              list = {
                keys = {
                  ["z"] = "explorer_close_all",
                  ["]c"] = "explorer_git_next",
                  ["[c"] = "explorer_git_prev",
                  ["w"] = "window_picker",
                },
              },
            },
          },
        },
      },
    },
  },
}
