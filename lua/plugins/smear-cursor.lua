return {
    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        opts = {
            -- Hiệu ứng smear khi chuyển buffer hoặc cửa sổ
            smear_between_buffers = true,

            -- Hiệu ứng smear khi di chuyển trong dòng hoặc giữa các dòng
            smear_between_neighbor_lines = true,

            -- Vẽ smear trong không gian buffer thay vì không gian màn hình khi cuộn
            scroll_buffer_space = true,

            -- Giảm stiffness để làm chậm hiệu ứng
            stiffness = 0.4,
            trailing_stiffness = 0.3,
            distance_stop_animating = 1.0,

            -- Màu cursor phù hợp với Dracula theme
            cursor_color = "#f8f8f2",

            -- Màu nền cho trường hợp transparent
            transparent_bg_fallback_color = "#282a36",

            -- Hỗ trợ font với legacy computing symbols
            legacy_computing_symbols_support = true,
        }
    }
}