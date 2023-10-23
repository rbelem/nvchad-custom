local opts = {
  autosave = {
    enabled = true,
    interval = 60,
    notify = true,
  },
  buf_filter = function(bufnr)
      local buftype = vim.bo[bufnr].buftype
      if buftype == 'help' then
        return true
      end
      if buftype ~= "" and buftype ~= "acwrite" then
        return false
      end
      if vim.api.nvim_buf_get_name(bufnr) == "" then
        return false
      end

      -- this is required, since the default filter skips nobuflisted buffers
      return true
  end,
  dir = "resession",
  extensions = {
    scope = {} -- add scope.nvim extension
  },
}

local config = function (_, options)
  options = vim.tbl_deep_extend("force", options, opts)
  local resession = require("resession")
  resession.setup(options)

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      -- Always save a special session named "last"
      resession.save("last")
    end,
  })

  vim.api.nvim_create_user_command("ResessionDelete",
    function()
      resession.delete()
    end,
    { bang = true, nargs = "*", desc = "Delete Session" }
  )

  vim.api.nvim_create_user_command("ResessionLoad",
    function()
      resession.load()
    end,
    { bang = true, nargs = "*", desc = "Load Session" }
  )

  vim.api.nvim_create_user_command("ResessionSave",
    function()
      if resession.get_current() == "last" then
        vim.ui.input({ prompt = 'Enter session name: ' }, function(input)
          resession.save(input)
        end)
      else
        resession.save()
      end
    end,
    { bang = true, nargs = "*", desc = "Save Session" }
  )

  vim.api.nvim_create_user_command("ResessionSaveTab",
    function()
      resession.save_tab()
    end,
    { bang = true, nargs = "*", desc = "Save Tab Session" }
  )

  vim.api.nvim_create_user_command("ResessionSaveAll",
    function()
      resession.save_all()
    end,
    { bang = true, nargs = "*", desc = "Save All Sessions" }
  )
end

return config
