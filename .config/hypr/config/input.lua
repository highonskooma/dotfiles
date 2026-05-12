hl.config({
	input = {
		kb_layout = "us,pt",
		kb_options = "grp:alt_space_toggle",
		follow_mouse = 1,
	},
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
