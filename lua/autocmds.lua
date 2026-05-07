-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Trim trailing whitespaces on save for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
  desc = 'Trim trailing white spaces',
  pattern = 'bash,c,cpp,lua,java,go,php,javascript,make,python,rust,perl,sql,markdown',
  callback = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '<buffer>',
      callback = function()
        local curpos = vim.api.nvim_win_get_cursor(0)
        vim.cmd [[keeppatterns %s/\s\+$//e]]
        vim.api.nvim_win_set_cursor(0, curpos)
      end,
    })
  end,
})

-- When opened with a directory argument (e.g. nvim .), replace the
-- directory buffer with an empty buffer and open neo-tree for that directory
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Open neo-tree when nvim is opened with a directory argument',
  group = vim.api.nvim_create_augroup('neotree-dir-open', { clear = true }),
  callback = function()
    local arg = vim.fn.argv(0)
    if type(arg) == 'string' and vim.fn.isdirectory(arg) == 1 then
      vim.schedule(function()
        vim.cmd 'enew'
        vim.cmd('Neotree dir=' .. vim.fn.fnamemodify(arg, ':p'))
      end)
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
