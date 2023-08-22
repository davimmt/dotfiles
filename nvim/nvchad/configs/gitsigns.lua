local opts = {
  signs = {
    change = { numhl = 'DiffModified', hl = 'DiffModified' },
    untracked = { linehl = '', numhl = '', hl = 'DevIconSh' },
  --   add          = { text = '│' },
  --   change       = { text = '│' },
  --   delete       = { text = '_' },
  --   topdelete    = { text = '‾' },
  --   changedelete = { text = '~' },
  --   untracked    = { text = '┆' },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<A-c>', function()
      if vim.wo.diff then return '<A-c>' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<A-x>', function()
      if vim.wo.diff then return '<A-c>' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview' })
    map('n', '<leader>gP', gs.preview_hunk_inline, { desc = 'Preview inline' })
    map('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage' })
    map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset' })
    map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage' })
    map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset' })
    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Unstage' })
    map('n', '<leader>gb', function() gs.blame_line{full=true} end, { desc = 'Blame' })
    map('n', '<leader>gB', gs.toggle_current_line_blame, { desc = 'Blame toggle' })
    map('n', '<leader>gd', gs.diffthis, { desc = 'Diff line' })
    map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = 'Diff hunk' })
    map('n', '<leader>gt', gs.toggle_deleted, { desc = 'Toggle deleted' })

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
  end
}

return opts
