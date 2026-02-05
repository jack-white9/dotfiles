vim.opt.relativenumber = true

-- Set filetype for terraform tfvars files
vim.filetype.add({
  extension = {
    tfvars = "terraform",
  },
})
