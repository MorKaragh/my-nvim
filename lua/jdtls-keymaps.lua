local keymap = vim.keymap
keymap.set("n", '<leader>go', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports();
  end
end)

keymap.set("n", '<leader>gu', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_projects_config();
  end
end)

keymap.set("n", '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class();
  end
end)

keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method();
  end
end)
