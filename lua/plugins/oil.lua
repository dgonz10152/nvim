return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '.git'
          end,
        },
        win_options = {
          wrap = true,
          winbar = "%!v:lua.require'oil'.get_current_dir()",
        },
        keymaps = {
          ["<CR>"] = {
            desc = "Open entry, closing all oil buffers if it's a file",
            callback = function()
              local oil = require("oil")
              local entry = oil.get_cursor_entry()
              if not entry then return end
              if entry.type == "directory" then
                oil.select()
              else
                local target = oil.get_current_dir() .. entry.name
                local image_ext = {
                  png = true, jpg = true, jpeg = true, gif = true, bmp = true,
                  webp = true, tif = true, tiff = true, heic = true, svg = true, ico = true,
                }
                local ext = entry.name:lower():match("%.([^.]+)$")
                if ext and image_ext[ext] then
                  vim.system({ "open", target })
                  return
                end
                local oil_bufs = {}
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                  if vim.api.nvim_buf_is_loaded(buf)
                    and vim.bo[buf].filetype == "oil" then
                    table.insert(oil_bufs, buf)
                  end
                end
                vim.cmd("edit " .. vim.fn.fnameescape(target))
                for _, buf in ipairs(oil_bufs) do
                  if vim.api.nvim_buf_is_valid(buf) then
                    pcall(vim.api.nvim_buf_delete, buf, { force = true })
                  end
                end
              end
            end,
          },
          ["<S-CR>"] = {
            desc = "Open entry in vertical split",
            callback = function()
              local oil = require("oil")
              local entry = oil.get_cursor_entry()
              if not entry then return end
              local target = oil.get_current_dir() .. entry.name
              vim.cmd("vsplit")
              vim.cmd("wincmd l")
              if entry.type == "directory" then
                oil.open(target)
              else
                vim.cmd("edit " .. vim.fn.fnameescape(target))
              end
            end,
          },
        },
      })
    end,
  }
