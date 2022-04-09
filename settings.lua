data:extend({
	{
		type = "bool-setting",
		name = "TinyStart-init-spawn",
		setting_type = "startup",
		default_value = true,
		order = "b"
	},
	{
		type = "bool-setting",
		name = "TinyStart-marathon-start",
		setting_type = "startup",
		default_value = false,
		order = "c"
	},
	{
		type = "bool-setting",
		name = "TinyStart-spawn-charged",
		setting_type = "runtime-per-user",
		default_value = true,
		order = "a"
	},
	{
		type = "string-setting",
		name = "TinyStart-fusion-solar",
		setting_type = "runtime-per-user",
		default_value = "Fusion",
		allowed_values = {"Fusion", "Solar"},
		order = "b"
	},
	{
		type = "string-setting",
		name = "TinyStart-shield",
		setting_type = "runtime-per-user",
		default_value = "Shield",
		allowed_values = {"Fusion", "Shield", "Solar", "Battery"},
		order = "c"
	},
	{
		type = "string-setting",
		name = "TinyStart-battery",
		setting_type = "runtime-per-user",
		default_value = "Battery",
		allowed_values = {"Battery", "Solar"},
		order = "d"
	},
	{
		type = "string-setting",
		name = "TinyStart-roboport-type",
		setting_type = "runtime-per-user",
		default_value = "Basic",
		allowed_values = {"Basic", "Mk II"},
		order = "e"
	}
})