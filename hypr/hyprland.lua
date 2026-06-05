-- Hyprland v0.55 Lua Configuration

local mainMod = "SUPER"

--------------------------------------------------------------------------------
-- MONITORS
--------------------------------------------------------------------------------
hl.monitor({
	{ name = "eDP-1", resolution = "1920x1080@60", position = "0x0", scale = 1, mirror = true },
	{ name = "HDMI-A-1", resolution = "1920x1080@60", position = "1920x0", scale = 1 },
})

--------------------------------------------------------------------------------
-- AUTOSTART (exec-once)
--------------------------------------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hyprpaper & swaync & hypridle")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
end)

--------------------------------------------------------------------------------
-- WORKSPACE RULES
--------------------------------------------------------------------------------
-- Monitor 1
for w = 1, 5 do
	hl.workspace_rule({ workspace = tostring(w), monitor = "eDP-1" })
end

-- Monitor 2
for w = 6, 10 do
	hl.workspace_rule({ workspace = tostring(w), monitor = "HDMI-A-1" })
end

--------------------------------------------------------------------------------
-- MAIN CONFIGURATION
--------------------------------------------------------------------------------
hl.config({
	input = {
		kb_layout = "gb",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = false,
		},
		sensitivity = 0,
	},

	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		col = {
			active_border = "rgba(fac29aff)",
			inactive_border = "rgba(595959aa)",
		},
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		-- drop_shadow and other deprecated shadow variants commented out
	},

	dwindle = {
		-- pseudotile = true -> REMOVED: dropped in v0.55 breaking changes
		preserve_split = true,
	},

	master = {
		-- new_is_master = true
	},

	gestures = {
		-- workspace_swipe = false
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = -1,
	},

	debug = {
		disable_logs = false,
	},
})

--------------------------------------------------------------------------------
-- ANIMATIONS & BEZIERS
--------------------------------------------------------------------------------
hl.curve("wsfade", { type = "bezier", points = { { 0.34, 1.3 }, { 0.64, 1 } } })
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.00 } } })

hl.animation("windowsIn", { duration = 1, speed = 1, curve = "wsfade", style = "slide" })
hl.animation("windowsOut", { duration = 1, speed = 1, curve = "wsfade", style = "slide" })
hl.animation("border", { duration = 1, speed = 1, curve = "default" })
hl.animation("borderangle", { duration = 1, speed = 1, curve = "default" })
hl.animation("fade", { duration = 1, speed = 1, curve = "default" })
hl.animation("workspaces", { duration = 1, speed = 1, curve = "wsfade" })

--------------------------------------------------------------------------------
-- KEYBINDS
--------------------------------------------------------------------------------

-- Standard binds
hl.bind(mainMod .. " + Q", hl.dsp.exec("kitty"))
hl.bind(mainMod .. " + C", hl.dsp.killactive())
hl.bind(mainMod .. " + E", hl.dsp.exec("dolphin"))
hl.bind(mainMod .. " + V", hl.dsp.togglefloating())
hl.bind(mainMod .. " + P", hl.dsp.exec("wofi --show drun"))
hl.bind(mainMod .. " + D", hl.dsp.pseudo())
hl.bind(mainMod .. " + S", hl.dsp.togglesplit())

-- Move Focus
hl.bind(mainMod .. " + H", hl.dsp.movefocus("l"))
hl.bind(mainMod .. " + L", hl.dsp.movefocus("r"))
hl.bind(mainMod .. " + K", hl.dsp.movefocus("u"))
hl.bind(mainMod .. " + J", hl.dsp.movefocus("d"))

-- Move Window Directionally
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.movewindow("l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.movewindow("r"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.movewindow("u"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.movewindow("d"))

-- Switch Workspaces & Move Windows to Workspaces (Lua Loop!)
for i = 1, 10 do
	local ws = tostring(i)
	local key = tostring(i % 10) -- Maps 10 to key "0"

	-- Switch to workspace
	hl.bind(mainMod .. " + " .. key, hl.dsp.workspace(ws))
	-- Move active window to workspace
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.movetoworkspace(ws))
end

-- Mouse scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.workspace("e+1"))
hl.bind(mainMod .. " + mouse_up", hl.dsp.workspace("e-1"))

-- Move / Resize windows (Mouse)
hl.bind(mainMod .. " + mouse:272", hl.dsp.movewindow(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.resizewindow(), { mouse = true })

-- Screenshot / Copy
hl.bind("SUPER_SHIFT + S", hl.dsp.exec('grim -g "$(slurp)" - | wl-copy'))

-- Notifications & Lock Screen
hl.bind(mainMod .. " + N", hl.dsp.exec("swaync-client -t"))
hl.bind("SUPER_SHIFT + Delete", hl.dsp.exec("loginctl lock-session"))

-- Audio & Media Controls (Using repeating/locked flags via bindel -> { repeating = true, locked = true })
local mediaFlags = { repeating = true, locked = true }

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec(
		'wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ && canberra-gtk-play -i audio-volume-change -d "change volume"'
	),
	mediaFlags
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec(
		'wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- && canberra-gtk-play -i audio-volume-change -d "change volume"'
	),
	mediaFlags
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec(
		'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && canberra-gtk-play -i audio-volume-change -d "change volume"'
	),
	mediaFlags
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec(
		'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && canberra-gtk-play -i audio-volume-change -d "change volume"'
	),
	mediaFlags
)

-- Brightness Controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec("brightnessctl -d intel_backlight set 10%+"), mediaFlags)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec("brightnessctl -d intel_backlight set 10%-"), mediaFlags)
