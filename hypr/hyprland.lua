-- Refer to the wiki for more information.

--
-- Please note not all available settings / options are set here.
-- For a full list, see the wiki
--

-- See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({
	output = "",
	mode = "preffered",
	position = "auto",
	scale = "1",
})

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("deluged")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("swaync")
	hl.exec_cmd("~/.config/hypr/scripts/xdg-portal-hyprland")
	hl.exec_cmd("lxqt-policykit-agent")
	hl.exec_cmd("~/.config/hypr/scripts/wlsunset.sh")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("playerctld daemon")
	hl.exec_cmd("/usr/bin/pypr")
	hl.exec_cmd("clipse -listen")
end)

-- Env. variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("HYPRCURSOR_SIZE", "24")

-- Source a file (multi-file configs)
-- require("myColors")

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/
hl.config({
	input = {
		kb_layout = "cz",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = true,

		follow_mouse = 2,

		touchpad = {
			natural_scroll = false,
			tap_to_click = true,
			disable_while_typing = false,
			clickfinger_behavior = true,
		},

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},

	general = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		-- Color picker (https://www.w3schools.com/colors/colors_picker.asp)

		gaps_in = 3,
		gaps_out = 4,
		border_size = 2,
		col = {
			active_border = { colors = { "rgb(9966ff)", "rgb(9966ff)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "dwindle",
	},

	scrolling = {
		column_width = 0.5,
		direction = "right",
		focus_fit_method = 1,
		follow_focus = true,
		fullscreen_on_one_column = true,
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
	},

	-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
	master = {
		new_status = "master",
	},

	-- https://wiki.hypr.land/Configuring/Variables/
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background.
		on_focus_under_fullscreen = 2,
		animate_manual_resizes = true, -- resize animations
		animate_mouse_windowdragging = true, -- mouse resize animation
		middle_click_paste = true,
		enable_swallow = false,
		swallow_regex = "^(kitty)$",
		swallow_exception_regex = "^(wpp.*|wps.*|et.*|.*\\.tex.*|xev|wev)$",
	},

	-- Ecosystem variables
	ecosystem = {
		no_update_news = true,
	},

	decoration = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more

		rounding = 10,

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default" })

hl.config({
	dwindle = {
		-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
		preserve_split = true, -- you probably want this
		force_split = 2,
	},

	gestures = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		workspace_swipe_invert = false,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.config({
	-- See https://wiki.hyprland.org/0.46.0/Configuring/Variables/ for more
	binds = {
		movefocus_cycles_fullscreen = 1,
	},
})

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- WINDOW RULES
-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
hl.window_rule({
	name = "waypaper",
	match = {
		class = "waypaper",
	},
	float = true,
	center = true,
	size = { 560, 570 },
})

hl.window_rule({
	name = "clipse-gui",
	match = {
		class = "clipse-gui",
	},
	float = true,
	center = true,
	size = { 560, 570 },
})

hl.window_rule({
	name = "localsend",
	match = {
		class = "localsend",
	},
	float = true,
	center = true,
	size = { 560, 570 },
})

hl.window_rule({
	name = "lxqt-policykit-agent",
	match = {
		class = "lxqt-policykit-agent",
	},
	float = true,
	center = true,
	size = { 1000, 500 },
})

hl.window_rule({
	name = "steam",
	match = {
		class = "steam",
	},
	workspace = "3",
})

-- Variables://wiki.hyprland.org/Configuring/Keywords/ for more
local mod = "SUPER"
local terminal = "kitty"
local filemanager = "kitty -e yazi"

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + S", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Volume & brightness & media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute 0 toggle"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- Aplikace
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/reload.sh"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(filemanager))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd(terminal .. " -e pulsemixer"))
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind("CTRL + SHIFT + P", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + C", hl.dsp.exec_cmd(terminal .. " -e calcurse"))
hl.bind(mod .. " + O", hl.dsp.exec_cmd("libreoffice"))
hl.bind(mod .. " + M", hl.dsp.exec_cmd("thunderbird"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd(terminal .. " -e newsboat"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("clipse-gui"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("localsend"))

-- Pypr scratchpads
hl.bind(mod .. " + S", hl.dsp.exec_cmd("pypr toggle music"))
hl.bind(mod .. " + T", hl.dsp.exec_cmd("pypr toggle htop"))

-- Printscreen
hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify --freeze copysave screen"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast copysave area --freeze --notify"))

-- Rofi Controls
hl.bind(mod .. " + SHIFT + F", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("~/.config/rofi/scripts/rofi-calc.sh"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/waybar/scripts/waybar-theme.sh"))
hl.bind(mod .. " + Escape", hl.dsp.exec_cmd("~/.config/rofi/scripts/rofi-powermenu.sh"))

-- Move focus
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Resize windows (vim keys)
hl.bind(mod .. " + CTRL + h", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + l", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + k", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + j", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

-- Resize windows (arrow keys)
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Resize windows (vim keys)
hl.bind(mod .. " + CTRL + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

-- Move windows
hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mod + [0-9]
hl.bind(mod .. " + plus", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + ecaron", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + scaron", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + ccaron", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + rcaron", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + zcaron", hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + yacute", hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + aacute", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + iacute", hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + eacute", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mod + SHIFT + [0-9]
hl.bind(mod .. " + SHIFT + plus", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + SHIFT + ecaron", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + SHIFT + scaron", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + SHIFT + ccaron", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + SHIFT + rcaron", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + SHIFT + zcaron", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + SHIFT + yacute", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mod .. " + SHIFT + aacute", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mod .. " + SHIFT + iacute", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mod .. " + SHIFT + eacute", hl.dsp.window.move({ workspace = 10 }))

-- Switch to workspace using numpad
hl.bind(mod .. " + KP_End", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + KP_Down", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + KP_Next", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + KP_Left", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + KP_Begin", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + KP_Right", hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + KP_Home", hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + KP_Up", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + KP_Prior", hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + KP_Insert", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with numpad + SHIFT + [0-9]
hl.bind(mod .. " + SHIFT + KP_End", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + SHIFT + KP_Down", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + SHIFT + KP_Next", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + SHIFT + KP_Left", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + SHIFT + KP_Begin", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + SHIFT + KP_Right", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + SHIFT + KP_Home", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mod .. " + SHIFT + KP_Up", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mod .. " + SHIFT + KP_Prior", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mod .. " + SHIFT + KP_Insert", hl.dsp.window.move({ workspace = 10 }))

-- Scroll through existing workspaces with mod + scroll + keys
hl.bind(mod .. " + ALT + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + ALT + left", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binding
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
