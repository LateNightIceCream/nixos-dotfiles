{ config, ... }:

''
  general {
    col.active_border = rgba(${config.colorScheme.colors.base09}ff)
    col.inactive_border = rgba(${config.colorScheme.colors.base00}ff)
  }

  decoration {
    rounding = 8

    blur {
      enabled = true
      size = 6
      passes = 3
      new_optimizations = true
      ignore_opacity = true
    }

    drop_shadow = true
    shadow_range = 6
    shadow_render_power = 3

    col.shadow = rgba(212121ee)
  }

  general {
    gaps_in = 4
    gaps_out = 16
    border_size = 2
    layout = dwindle
  }

''
