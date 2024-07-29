--[[ wezterm.lua
-- $ figlet -f small Wezterm
-- __      __      _
-- \ \    / /__ __| |_ ___ _ _ _ __
--  \ \/\/ / -_)_ /  _/ -_) '_| '  \
--   \_/\_/\___/__|\__\___|_| |_|_|_|
--
-- My Wezterm config file
--]]
local wezterm = require("wezterm")
local act = wezterm.action

local powershell = "C:\\Program Files\\PowerShell\\7\\pwsh.exe"

-- local arch = "C:\\Windows\\system32\\wsl.exe"
-- local nu = "D:\\Scoop\\apps\\nu\\current\\nu.exe"

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
-- config.default_prog = { nu, "-l" }
config.default_prog = { powershell }
-- config.default_prog = { arch }
-- config.default_cwd = "N:\\"

-- config.color_scheme = "Espresso"
config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "tokyonight_moon"
-- config.color_scheme = "OneDark (base16)"
config.line_height = 1.3
config.font = wezterm.font_with_fallback({
	{ family = "DankMono Nerd Font", scale = 1.10, weight = "Medium" },
	-- { family = "UbuntuMono Nerd Font", scale = 1.20, weight = "Medium" },
	-- { family = "ZedMono Nerd Font",       scale = 0.85,      weight = "Regular" },
	-- { family = "JetBrainsMono Nerd Font", scale = 1.0,       weight = "Bold" },
	-- { family = "Cascadia Code", scale = 1.0, weight = "Regular" },
	-- { family = "MonaspiceNe Nerd Font",   weight = "Medium" },
	-- { family = "MonaspiceAr Nerd Font", scale=1.1,   weight = "Regular" },
	-- { family = "MonaspiceKr Nerd Font",   weight = "Medium" },
	-- { family = "MonaspiceRn Nerd Font",   weight = "Regular" },
})
config.font_size = 12
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.disable_default_key_bindings = true

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.50,
	brightness = 0.6,
}

-- Keys
config.leader = { key = "o", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "LEADER", action = act.CopyTo("ClipboardAndPrimarySelection") },

	-- Tab
	{ key = "Tab", mods = "CTRL|SHIFT", action = act({ ActivateTabRelative = -1 }) },
	{ key = "Tab", mods = "CTRL", action = act({ ActivateTabRelative = 1 }) },

	-- Pane keybindings
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	-- Tab keybindings
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Blue" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "q", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false
--wezterm.on("update-status", function(window, pane)
-- Workspace name
-- local stat = window:active_workspace()
-- local stat_color = "#f7768e"
-- It's a little silly to have workspace name all the time
-- Utilize this to display LDR or current key table name
-- if window:active_key_table() then
-- stat = window:active_key_table()
-- stat_color = "#7dcfff"
-- end
-- if window:leader_is_active() then
-- stat = "LDR"
-- stat_color = "#bb9af7"
-- end

-- Current working directory
--local basename = function(s)
-- Nothing a little regex can't fix
--return string.gsub(s, "(.*[/\\])(.*)", "%2")
--end
-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
--local cwd = pane:get_current_working_dir()
--cwd = cwd and basename(cwd) or ""
-- Current command
--local cmd = pane:get_foreground_process_name()
--cmd = cmd and basename(cmd) or ""

-- Time
--local time = wezterm.strftime("%H:%M:%S")

-- Left status (left of the tab line)
-- window:set_left_status(wezterm.format({
-- { Foreground = { Color = stat_color } },
-- { Text = "  " },
-- { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
-- { Text = " |" },
-- }))

-- Right status
-- window:set_right_status(wezterm.format({
-- Wezterm has a built-in nerd fonts
-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
-- { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
-- { Text = " | " },
-- { Foreground = { Color = "#e0af68" } },
-- { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
-- "ResetAttributes",
-- { Text = " | " },
-- { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
-- { Text = "  " },
-- }))
--end)

-- Appearance setting for when I need to take pretty screenshots
-- config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config