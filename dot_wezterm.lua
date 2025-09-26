local wezterm = require 'wezterm'

local config = wezterm.config_builder()

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Rosé Pine (Gogh)'
  else
    return 'Rosé Pine Dawn (Gogh)'
  end
end


config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font('Iosevka Nerd Font Mono')
config.font_size = 14.0


return config
