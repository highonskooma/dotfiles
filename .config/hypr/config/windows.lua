hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	match = { class = "floating" },
	float = true,
	size = { 1200, 700 },
})

hl.window_rule({
	match = { class = "clipse" },
	float = true,
	size = { 622, 652 },
})

hl.window_rule({
	match = {
		title = "^(galculator|.*Thunar.*|.*Volume Control.*|.*Bluetooth.*)$",
	},
	float = true,
	size = { 1200, 700 },
})

hl.window_rule({
	match = {
		title = "^(galculator)$",
	},
	float = true,
	size = { 400, 400 },
})

hl.window_rule({
	match = {
		class = "^(org.gnome.FileRoller|xdg-desktop-portal-gtk)$",
	},
	float = true,
	size = { 1200, 700 },
	center = true,
})

hl.window_rule({
	match = {
		class = "^(hyprland-share-picker)$",
	},
	float = true,
	size = { 600, 400 },
	center = true,
})

hl.window_rule({
	match = { title = "^(.*btop.*)$" },
	workspace = "1 silent",
})

hl.window_rule({
	match = { class = "^(.*discord.*)$" },
	workspace = "2 silent",
})

hl.window_rule({
	match = { title = "^(.*steam.*)$" },
	workspace = "5 silent",
})

-- fullscreen idle inhibit
hl.window_rule({
	match = { fullscreen = true },
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.workspace_rule({
	workspace = "1",
	monitor = "HDMI-A-2",
})

hl.workspace_rule({
	workspace = "2",
	monitor = "HDMI-A-2",
	default = true,
})

hl.workspace_rule({
	workspace = "2",
	monitor = "HDMI-A-2",
})

hl.workspace_rule({
	workspace = "4",
	monitor = "DP-1",
	default = true,
})
