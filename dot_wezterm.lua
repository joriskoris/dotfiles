local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Rosé Pine Dawn (Gogh)'
config.font = wezterm.font('Iosevka Nerd Font Mono')
config.font_size = 14.0

return config
