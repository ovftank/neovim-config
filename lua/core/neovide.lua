vim.o.guifont = "JetBrainsMono Nerd Font:h12:#e-subpixelantialias:#h-slight"

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

vim.g.neovide_padding_top = 4
vim.g.neovide_padding_bottom = 4
vim.g.neovide_padding_right = 8
vim.g.neovide_padding_left = 8

local function get_bg_color()
    local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    return normal_hl.bg and string.format("#%06x", normal_hl.bg) or "#282a36"
end

local function get_fg_color()
    local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    return normal_hl.fg and string.format("#%06x", normal_hl.fg) or "#f8f8f2"
end

vim.g.neovide_title_background_color = get_bg_color()
vim.g.neovide_title_text_color = get_fg_color()

vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 1.0

vim.g.neovide_floating_blur_amount_x = 0.0
vim.g.neovide_floating_blur_amount_y = 0.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 0
vim.g.neovide_light_angle_degrees = 0
vim.g.neovide_light_radius = 0
vim.g.neovide_floating_corner_radius = 0.0

vim.g.neovide_position_animation_length = 0.0
vim.g.neovide_scroll_animation_length = 0.0
vim.g.neovide_scroll_animation_far_lines = 0

vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_underline_stroke_scale = 1.0

vim.g.neovide_theme = "dark"

vim.g.neovide_refresh_rate = 75
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = true

vim.g.neovide_confirm_quit = true
vim.g.neovide_detach_on_quit = "always_quit"
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true

vim.g.neovide_profiler = false

vim.g.neovide_cursor_hack = true
vim.g.neovide_input_ime = true

vim.g.neovide_touch_deadzone = 6.0
vim.g.neovide_touch_drag_timeout = 0.17

vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_short_animation_length = 0.0
vim.g.neovide_cursor_trail_size = 0.0
vim.g.neovide_cursor_antialiasing = false
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_unfocused_outline_width = 0.0
vim.g.neovide_cursor_smooth_blink = false

vim.g.neovide_cursor_vfx_mode = {}
vim.g.neovide_cursor_vfx_opacity = 0.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.0
vim.g.neovide_cursor_vfx_particle_density = 0.0
vim.g.neovide_cursor_vfx_particle_speed = 0.0
vim.g.neovide_cursor_vfx_particle_phase = 0.0
vim.g.neovide_cursor_vfx_particle_curl = 0.0
