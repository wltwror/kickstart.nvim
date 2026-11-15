-- flick.nvim: Low-latency inline AI assistant
return {
  {
    dir = vim.fn.expand '~/flick.nvim',
    name = 'flick.nvim',
    cmd = { 'Flick' },
    keys = {
      { '<leader>k', mode = { 'n', 'x' }, desc = 'Flick: Inline AI Assistant' },
    },
    opts = {
      keymap = '<leader>k',
      provider = 'opencode', -- 'antigravity', 'opencode', or 'gemini'
      model = 'space-bunny-alpha', -- 'space-bunny-alpha' (openrouter/stealth/space-bunny-alpha)
      context_lines = 1000,
    },
    config = function(_, opts)
      require('flick').setup(opts)
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
