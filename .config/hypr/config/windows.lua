hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

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
		class = "^(org.gnome.FileRoller)$",
	},
	float = true,
	size = { 1200, 700 },
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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

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
