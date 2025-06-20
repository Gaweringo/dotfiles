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
-- config.font = wezterm.font("JetBrainsMono NF")
config.font = wezterm.font("IosevkaTerm NF")
config.harfbuzz_features = { 'zero', 'cv18' }
config.color_scheme = "Tokyo Night (Gogh)"
config.color_scheme =  "iTerm2 Default"
config.color_scheme =  "Brogrammer"
config.color_scheme =  "Dark Pastel"
-- config.color_scheme =  "Nocturnal Winter"
-- config.color_scheme =  "synthwave"

-- Make the cursor be bg and fg reversed of thext it is on
-- config.force_reverse_video_cursor = true
-- Make cursor always black on white
config.colors = {
	cursor_fg = "black",
	cursor_bg = "white",
}

config.use_fancy_tab_bar = false
if string.find(config.font.font[1].family, "JetBrains") then
	config.font_size = 10
else
	config.font_size = 11
end
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = false
config.tab_and_split_indices_are_zero_based = true
config.window_decorations = "INTEGRATED_BUTTONS"

config.quick_select_patterns = {
	-- Path with \ backslash
	'(?:[.\\w\\-@~]+)?(?:[\\/\\\\]+[.\\w\\-@]+)+',
}

-- startup maximized
wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local ws = window:active_workspace()
	local state = ""
	local kt = window:active_key_table()
	if window:leader_is_active() then state = "LDR" end
	if kt then
		state = "MODE: " .. kt
	end

	local basename = function (s)
		if s ~= nil then
			return string.gsub(s, "(.*[/\\])(.*)", "%2")
		else
			return "Debug overlay"
		end
	end

	local fp = basename(pane:get_foreground_process_name())

	if state and state ~= '' then state = state .. " | " end

	window:set_right_status(wezterm.format({
		{ Text = state },
		{ Text = fp },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. ws .. " " },
	}))
end)

config.inactive_pane_hsb = {
	saturation = 0.90,
	brightness = 0.75
}

local act = wezterm.action
config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- Send "CTRL-Z" to the terminal when pressing CTRL-Z, CTRL-Z
	{
	  key = 'z',
	  mods = 'LEADER|CTRL',
	  action = wezterm.action.SendKey { key = 'z', mods = 'CTRL' },
	},
	-- Panes
	{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "z", action = act.TogglePaneZoomState },
	-- tmux style
	{ mods = "LEADER", key = "%", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = '"', action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "x", action = act.CloseCurrentPane({ confirm = true }) },
	-- Move between panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	-- -- Windows terminal style
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	-- -- -- Resize
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
	-- Resize pane mode
	{
		key = "R",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- Activate Pane UI
	-- { key = "a", mods = "LEADER", action = act.PaneSelect },
	{ key = "t", mods = "LEADER", action = act.PaneSelect({ mode = "MoveToNewTab" }) },
	{ key = "a", mods = "LEADER", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
	{ key = "r", mods = "LEADER", action = act.RotatePanes "Clockwise" },

	-- Tabs
	{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },

	-- Leader + number to switch to that numbered tab
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
	{ key = "Enter", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{
	   key = ',',
	   mods = 'LEADER',
	   action = act.PromptInputLine {
	     description = 'Enter new name for tab',
	     action = wezterm.action_callback(function(window, pane, line)
	       -- line will be `nil` if they hit escape without entering anything
	       -- An empty string if they just hit enter
	       -- Or the actual line of text they wrote
	       if line then
		 window:active_tab():set_title(line)
	       end
	     end),
	   },
	},
	-- Workspaces
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "$",
		mods = "LEADER|SHIFT",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "New name for current workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					wezterm.mux.rename_workspace(
						wezterm.mux.get_active_workspace(),
						line
					)
				end
			end),
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "W",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

if config.launch_menu == nil then
   config.launch_menu = {}
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  table.insert(config.launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })

  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in
    ipairs(
      wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')
    )
  do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(config.launch_menu, {
      label = 'Developer Powershell for VS ' .. year,
      args = {
        'powershell.exe',
        '-NoProfile',
        '-noe',
        '-c',
        '&{Import-Module "C:/Program Files/Microsoft Visual Studio/2022/Enterprise/Common7/Tools/Microsoft.VisualStudio.DevShell.dll"; Enter-VsDevShell 1753bb17}',
      },
    })
    table.insert(config.launch_menu, {
      label = 'Dev Cmd / x64 Native Tools VS ' .. year,
      args = {
        'cmd.exe',
        '/k',
        'C:/Program Files (x86)/'
          .. vsvers
          .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
      },
    })
  end
end

return config
