local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

{{#if (is_executable "fish")}}
-- Spawn a fish shell in login mode
config.default_prog = { "fish" }
{{/if}}
{{#if (is_executable "pwsh")}}
-- Spawn a pwsh shell in login mode
config.default_prog = { "pwsh" }
{{/if}}

-- config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Tokyo Night (Gogh)"
config.colors = {
	cursor_fg = "black",
}

config.use_fancy_tab_bar = false
config.font_size = 10
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.tab_and_split_indices_are_zero_based = true

-- startup maximized
wezterm.on('gui-startup', function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local act = wezterm.action
config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }), },
	{ mods = "LEADER", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }), },
	{ mods = "LEADER", key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }), },
	{ mods = "LEADER", key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }), },

	{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain"), },

	{ key = "q", mods = "ALT", action = act.CloseCurrentPane({ confirm = false }), },

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
	{ key = "Enter", mods = "LEADER", action = wezterm.action.ActivateCopyMode, },

	{ key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
	{ key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
	{ key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
	{ key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },

	-- tmux style
	{ mods = "LEADER", key = "%", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }), },
	{ mods = "LEADER", key = '"', action = act.SplitVertical({ domain = "CurrentPaneDomain" }), },
	{ mods = "LEADER", key = "x", action = act.CloseCurrentPane({ confirm = true }), },
}

return config
