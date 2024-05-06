local hop = require('hop')
local directions = require('hop.hint').HintDirection

-- hint char 1
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})

vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

vim.keymap.set('', ',', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = 0 })
end, {remap=true})
vim.keymap.set('', '-', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 0 })
end, {remap=true})


hop.setup { 
  keys = 'etovxqpdygfblzhckisuran',
  uppercase_labels = true,
  multi_windows = true,
}
