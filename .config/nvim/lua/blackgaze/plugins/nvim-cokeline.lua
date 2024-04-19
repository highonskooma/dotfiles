return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim"       -- Optional, for persistent history
	},
	config = function()

		-- vim.keymap.set("n", "<leader>e", function()
		-- 	require('cokeline.mappings').pick("focus")
		-- end, { desc = "Pick a buffer to focus" })

		local map = vim.api.nvim_set_keymap

		map("n", "<leader>e", "<Plug>(cokeline-pick-focus)", { silent = true })
		map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
		map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
		-- map("n", "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true })
		-- map("n", "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true })


		require('cokeline').setup({
			-- Only show the bufferline when there are at least this many visible buffers.
			-- default: `1`.
			---@type integer
			show_if_buffers_are_at_least = 0,

			buffers = {
				-- A function to filter out unwanted buffers. Takes a buffer table as a
				-- parameter (see the following section for more infos) and has to return
				-- either `true` or `false`.
				-- default: `false`.
				---@type false | fun(buf: Buffer):boolean
				filter_valid = false,

				-- A looser version of `filter_valid`, use this function if you still
				-- want the `cokeline-{switch,focus}-{prev,next}` mappings to work for
				-- these buffers without displaying them in your bufferline.
				-- default: `false`.
				---@type false | fun(buf: Buffer):boolean
				filter_visible = false,

				-- Which buffer to focus when a buffer is deleted, `prev` focuses the
				-- buffer to the left of the deleted one while `next` focuses the one the
				-- right.
				-- default: 'next'.
				focus_on_delete = 'prev',

				-- If set to `last` new buffers are added to the end of the bufferline,
				-- if `next` they are added next to the current buffer.
				-- if set to `directory` buffers are sorted by their full path.
				-- if set to `number` buffers are sorted by bufnr, as in default Neovim
				-- default: 'last'.
				---@type 'last' | 'next' | 'directory' | 'number' | fun(a: Buffer, b: Buffer):boolean
				new_buffers_position = 'last',

				-- If true, right clicking a buffer will close it
				-- The close button will still work normally
				-- Default: true
				---@type boolean
				delete_on_right_click = true,
			},

			mappings = {
				-- Controls what happens when the first (last) buffer is focused and you
				-- try to focus/switch the previous (next) buffer. If `true` the last
				-- (first) buffers gets focused/switched, if `false` nothing happens.
				-- default: `true`.
				---@type boolean
				cycle_prev_next = true,

				-- Disables mouse mappings
				-- default: `false`.
				---@type boolean
				disable_mouse = false,
			},

			-- Maintains a history of focused buffers using a ringbuffer
			history = {
				---@type boolean
				enabled = true,
				---The number of buffers to save in the history
				---@type integer
				size = 2
			},

			rendering = {
				-- The maximum number of characters a rendered buffer is allowed to take
				-- up. The buffer will be truncated if its width is bigger than this
				-- value.
				-- default: `999`.
				---@type integer
				max_buffer_width = 999,
			},

			pick = {
				-- Whether to use the filename's first letter first before
				-- picking a letter from the valid letters list in order.
				-- default: `true`
				---@type boolean
				use_filename = true,

				-- The list of letters that are valid as pick letters. Sorted by
				-- keyboard reachability by default, but may require tweaking for
				-- non-QWERTY keyboard layouts.
				-- default: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP'`
				---@type string
				letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP',
			},

			-- The default highlight group values.
			-- The `fg`, `bg`, and `sp` keys are either colors in hexadecimal format or
			-- functions taking a `buffer` parameter and returning a color in
			-- hexadecimal format. Style attributes work the same way, but functions
			-- should return boolean values.
			default_hl = {
				-- default: `ColorColumn`'s background color for focused buffers,
				-- `Normal`'s foreground color for unfocused ones.
				---@type nil | string | fun(buffer: Buffer): string
				fg = function(buffer)
					local hlgroups = require("cokeline.hlgroups")
					return buffer.is_focused and hlgroups.get_hl_attr("ColorColumn", "bg")
						or hlgroups.get_hl_attr("Normal", "fg")
				end,

				-- default: `Normal`'s foreground color for focused buffers,
				-- `ColorColumn`'s background color for unfocused ones.
				-- default: `Normal`'s foreground color.
				---@type nil | string | function(buffer: Buffer): string,
				bg = function(buffer)
					local hlgroups = require("cokeline.hlgroups")
					return buffer.is_focused and hlgroups.get_hl_attr("Normal", "fg")
						or hlgroups.get_hl_attr("ColorColumn", "bg")
				end,

				-- default: unset.
				---@type nil | string | function(buffer): string,
				sp = nil,

				---@type nil | boolean | fun(buf: Buffer):boolean
				bold = nil,
				---@type nil | boolean | fun(buf: Buffer):boolean
				italic = nil,
				---@type nil | boolean | fun(buf: Buffer):boolean
				underline = nil,
				---@type nil | boolean | fun(buf: Buffer):boolean
				undercurl = nil,
				---@type nil | boolean | fun(buf: Buffer):boolean
				strikethrough = nil,
			},

			-- The highlight group used to fill the tabline space
			fill_hl = 'TabLineFill',

			-- A list of components to be rendered for each buffer. Check out the section
			-- below explaining what this value can be set to.
			-- default: see `/lua/cokeline/config.lua`
			---@type Component[]
			-- components = {},

			-- Custom areas can be displayed on the right hand side of the bufferline.
			-- They act identically to buffer components, except their methods don't take a Buffer object.
			-- If you want a rhs component to be stateful, you can wrap it in a closure containing state.
			---@type Component[] | false
			-- rhs = {},

			-- Tabpages can be displayed on either the left or right of the bufferline.
			-- They act the same as other components, except they are passed TabPage objects instead of
			-- buffer objects.
			---@type table | false
			tabs = {
				placement = "right",
				---@type Component[]
				components = {}
			},

			-- Left sidebar to integrate nicely with file explorer plugins.
			-- This is a table containing a `filetype` key and a list of `components` to
			-- be rendered in the sidebar.
			-- The last component will be automatically space padded if necessary
			-- to ensure the sidebar and the window below it have the same width.
			---@type table | false
			sidebar = {
				---@type string | string[]
				filetype = { "NvimTree", "neo-tree", "SidebarNvim" },
				---@type Component[]
				components = {},
			},
		})
	end,
}
