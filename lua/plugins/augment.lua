return {
  {
    "AugmentCode/augment.vim",
    lazy = false,
    config = function()
      vim.g.augment_auto_start = 0

      vim.defer_fn(function()
        vim.api.nvim_create_user_command("AugmentSignin", function()
          vim.cmd("Augment signin")
        end, {})

        vim.api.nvim_create_user_command("AugmentStatus", function()
          vim.cmd("Augment status")
        end, {})

        vim.api.nvim_create_user_command("AugmentLoginJSON", function()
          local clipboard = vim.fn.getreg("+")
          if clipboard and clipboard ~= "" then
            local success, json_data = pcall(vim.fn.json_decode, clipboard)
            if success and json_data and json_data.code then
              vim.cmd("Augment token " .. json_data.code)
              print("Da gui code tu JSON: " .. json_data.code)
            else
              print("Clipboard khong chua JSON hop le voi field 'code'")
              print("Clipboard hien tai: " .. clipboard)
            end
          else
            print("Clipboard trong!")
          end
        end, {})

        vim.api.nvim_create_user_command("AugmentTokenDirect", function(opts)
          local code = opts.args
          if code and code ~= "" then
            vim.cmd("Augment token " .. code)
            print("Da gui code: " .. code)
          else
            print("Can nhap code! Dung :AugmentTokenDirect <code>")
          end
        end, { nargs = 1 })

      end, 2000)

    end,
  },
}
