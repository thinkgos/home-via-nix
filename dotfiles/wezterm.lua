local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Hack Nerd Font",
	"MesloLGS NF",
	"FiraCode Nerd Font",
	"Noto Sans CJK SC",
})
-- config.color_scheme = "Batman"
config.color_scheme = "iTerm2 Dark Background"

config.window_background_opacity = 0.85
config.default_cursor_style = "BlinkingBar"
config.window_padding = {
	left = 20,
	right = 20,
	top = 5,
	bottom = 5,
}

config.leader = { key = "m", mods = "CTRL", timeout_millisends = 1000 }
-- key binding
config.keys = {
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

for i = 1, 6 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
