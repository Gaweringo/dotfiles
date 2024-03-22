local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Spawn a fish shell in login mode
config.default_prog = { "pwsh" }

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
config.tab_and_split_indices_are_zero_based = true
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
local act = wezterm.action
config.keys = {
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
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

	{ key = "0", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "1", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(8) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(9) },

	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{
		key = "Enter",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
}
-- config.cursor_blink_rate = 200
-- config.default_cursor_style = "BlinkingBlock"
-- config.custom_block_glyphs = false

return config
