-- =============================================================================
-- FONT & SCALING
-- =============================================================================
vim.o.guifont = "JetBrainsMono Nerd Font:h12:#e-subpixelantialias:#h-slight"

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

-- =============================================================================
-- WINDOW PADDING
-- =============================================================================
vim.g.neovide_padding_top = 4
vim.g.neovide_padding_bottom = 4
vim.g.neovide_padding_right = 8
vim.g.neovide_padding_left = 8

-- =============================================================================
-- TITLE BAR COLORS
-- =============================================================================
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

-- =============================================================================
-- TRANSPARENCY & OPACITY
-- =============================================================================
vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 1.0

-- =============================================================================
--    WINDOW EFFECTS
-- =============================================================================
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
vim.g.neovide_floating_corner_radius = 0.2

-- =============================================================================
-- ANIMATION TIMING
-- =============================================================================
vim.g.neovide_position_animation_length = 0.12
vim.g.neovide_scroll_animation_length = 0.25
vim.g.neovide_scroll_animation_far_lines = 3

-- =============================================================================
-- CURSOR & INPUT
-- =============================================================================
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_underline_stroke_scale = 1.0

-- =============================================================================
-- THEME & APPEARANCE
-- =============================================================================
vim.g.neovide_theme = "dark"

-- =============================================================================
-- PERFORMANCE & REFRESH RATE
-- =============================================================================
vim.g.neovide_refresh_rate = 75
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = true

-- =============================================================================
-- WINDOW MANAGEMENT
-- =============================================================================
vim.g.neovide_confirm_quit = true
vim.g.neovide_detach_on_quit = "always_quit"
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true

-- =============================================================================
-- DEBUGGING
-- =============================================================================
vim.g.neovide_profiler = false

-- =============================================================================
-- CURSOR HACKS & INPUT
-- =============================================================================
vim.g.neovide_cursor_hack = true
vim.g.neovide_input_ime = true

-- =============================================================================
-- TOUCH INPUT
-- =============================================================================
vim.g.neovide_touch_deadzone = 6.0
vim.g.neovide_touch_drag_timeout = 0.17

-- =============================================================================
-- CURSOR ANIMATION
-- =============================================================================
vim.g.neovide_cursor_animation_length = 0.06
vim.g.neovide_cursor_short_animation_length = 0.03
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125
vim.g.neovide_cursor_smooth_blink = true

-- =============================================================================
-- CURSOR VISUAL EFFECTS
-- =============================================================================
vim.g.neovide_cursor_vfx_mode = { "railgun" }
vim.g.neovide_cursor_vfx_opacity = 120.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
vim.g.neovide_cursor_vfx_particle_density = 0.5
vim.g.neovide_cursor_vfx_particle_speed = 6.0
vim.g.neovide_cursor_vfx_particle_phase = 1.2
vim.g.neovide_cursor_vfx_particle_curl = 0.6
