local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		offsets = {
			{ filetype = "NvimTree", text = "", padding = 1 },
			{ filetype = "neo-tree", text = "", padding = 1 },
			{ filetype = "Outline",  text = "", padding = 1 },
		},
		style_preset = bufferline.style_preset.no_italic,
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		separator_style = "thin",
	},
})
