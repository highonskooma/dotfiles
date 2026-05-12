local vars = require("config.vars")

hl.bind(vars.mainMod .. " + C", hl.dsp.window.close())
hl.bind(
	vars.mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(vars.mainMod .. " + Q", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.mainMod .. " + W", hl.dsp.exec_cmd(vars.browser))
hl.bind(vars.mainMod .. " + T", hl.dsp.exec_cmd(vars.fileManager))

hl.bind(vars.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- should be: exec, hyprctl --batch "dispatch togglefloating ; dispatch centerwindow 1"
hl.bind(vars.mainMod .. " + D", hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(vars.mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(vars.mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move focus with vars.mainMod + arrow keys
hl.bind(vars.mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(vars.mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with vars.mainMod + [0-9]
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })

hl.bind(vars.mainMod .. " + " .. 1, hl.dsp.focus({ monitor = "HDMI-A-2" }))
hl.bind(vars.mainMod .. " + " .. 1, hl.dsp.focus({ workspace = "1" }))
hl.bind(vars.mainMod .. " + " .. 2, hl.dsp.focus({ monitor = "HDMI-A-2" }))
hl.bind(vars.mainMod .. " + " .. 2, hl.dsp.focus({ workspace = "2" }))
hl.bind(vars.mainMod .. " + " .. 3, hl.dsp.focus({ monitor = "HDMI-A-2" }))
hl.bind(vars.mainMod .. " + " .. 3, hl.dsp.focus({ workspace = "3" }))
hl.bind(vars.mainMod .. " + " .. 4, hl.dsp.focus({ monitor = "DP-1" }))
hl.bind(vars.mainMod .. " + " .. 4, hl.dsp.focus({ workspace = "4" }))
hl.bind(vars.mainMod .. " + " .. 5, hl.dsp.focus({ monitor = "DP-1" }))
hl.bind(vars.mainMod .. " + " .. 5, hl.dsp.focus({ workspace = "5" }))

-- Move active window to a workspace with vars.mainMod + SHIFT + [0-9]
hl.bind(vars.mainMod .. " + SHIFT + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(vars.mainMod .. " + SHIFT + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(vars.mainMod .. " + SHIFT + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(vars.mainMod .. " + SHIFT + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(vars.mainMod .. " + SHIFT + " .. 5, hl.dsp.window.move({ workspace = 5 }))

-- Swap window positions directional
hl.bind(vars.mainMod .. " + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(vars.mainMod .. " + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(vars.mainMod .. " + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(vars.mainMod .. " + down", hl.dsp.window.swap({ direction = "down" }))

-- Resize active window
hl.bind(vars.mainMod .. " + CTRL + h", hl.dsp.window.resize({ x = "-50", y = "0", relative = true }))
hl.bind(vars.mainMod .. " + CTRL + j", hl.dsp.window.resize({ x = "0", y = "50", relative = true }))
hl.bind(vars.mainMod .. " + CTRL + k", hl.dsp.window.resize({ x = "0", y = "-50", relative = true }))
hl.bind(vars.mainMod .. " + CTRL + l", hl.dsp.window.resize({ x = "50", y = "0", relative = true }))

-- System binds
hl.bind(vars.mainMod .. " + ESCAPE", hl.dsp.exec_cmd("~/Scripts/suspend.sh"))

-- Example special workspace (scratchpad)
hl.bind(vars.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(vars.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with vars.mainMod + scroll
hl.bind(vars.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with vars.mainMod + LMB/RMB and dragging
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
-- binde =, XF86AudioLowerVolume, exec, wpctl set-volume --limit 1.5 @DEFAULT_AUDIO_SINK@ 1%- && volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $2 * 100}') && dunstify -h string:x-canonical-private-synchronous:volume "Volume: ${volume}%" -h int:value:"$volume"
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"wpctl set-volume --limit 1.5 @DEFAULT_AUDIO_SINK@ 1%+ && "
			.. "volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf \"%d\", $2 * 100}') && "
			.. 'dunstify -h string:x-canonical-private-synchronous:volume "Volume: ${volume}%" -h int:value:"$volume"'
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"wpctl set-volume --limit 1.5 @DEFAULT_AUDIO_SINK@ 1%- && "
			.. "volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf \"%d\", $2 * 100}') && "
			.. 'dunstify -h string:x-canonical-private-synchronous:volume "Volume: ${volume}%" -h int:value:"$volume"'
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(
		"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@) && "
			.. "volume=$(echo '$raw' | awk '{printf \"%d\", $2 * 100}') && label=$(echo '$raw' | grep -q MUTED && "
			.. "echo 'Muted' || echo '$(echo $raw | awk '{printf \"%d\", $2 * 100}')%') && "
			.. "dunstify -h string:x-canonical-private-synchronous:volume 'Volume: $label' -h int:value:$volume"
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })

-- Brightness
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(
		"ddcutil setvcp --display 1 10 - 20 && ddcutil setvcp --display 2 10 - 20 && "
			.. "notify-send \"Brightness - $(ddcutil getvcp 10 | grep -oP 'current value =\\s*\\K\\d+')%\""
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(
		"ddcutil setvcp --display 1 10 + 20 && ddcutil setvcp --display 2 10 + 20 && "
			.. "notify-send \"Brightness - $(ddcutil getvcp 10 | grep -oP 'current value =\\s*\\K\\d+')%\""
	),
	{ locked = true, repeating = true }
)

-- Other shortcuts
hl.bind(vars.mainMod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("kitty --class floating btop"))
hl.bind(vars.mainMod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("kitty --class floating spf"))
hl.bind(vars.mainMod .. " + XF86Favorites", hl.dsp.exec_cmd("kitty --class floating fzf"))
hl.bind(vars.mainMod .. " + XF86Search", hl.dsp.exec_cmd("kitty --class floating rmpc"))

-- Swaync Control Center
hl.bind(vars.mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Main monitor refresh rate (dark souls 3 workaround)
hl.bind(vars.mainMod .. " + G", hl.dsp.exec_cmd("~/Scripts/frame-rate-toggle.sh game"))
hl.bind(vars.mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("~/Scripts/frame-rate-toggle.sh normal"))

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot utilities
hl.bind("Print", hl.dsp.exec_cmd("grimblast --freeze copysave area"))
hl.bind(
	vars.mainMod .. " + Print",
	hl.dsp.exec_cmd("grimblast --freeze copy output && dunstify 'Screenshot saved and copied.'")
)

-- Clipse (clipboard)
hl.bind(vars.mainMod .. " + B", hl.dsp.exec_cmd("kitty --class clipse -e 'clipse'"), { locked = true })
