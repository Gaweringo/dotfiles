local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Tokyo Night (Gogh)"
config.colors = {
	cursor_fg = "black",
}
-- config.color_scheme = "tokyonight_night"
config.use_fancy_tab_bar = false
config.font_size = 10
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
	{
		key = "q",
		mods = "ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		-- Make CTRL+SHIFT+2 actually go to the second tab
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTab(2 - 1),
	},
}
-- config.cursor_blink_rate = 200
-- config.default_cursor_style = "BlinkingBlock"
-- config.custom_block_glyphs = false

return config
