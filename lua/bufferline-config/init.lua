require("bufferline").setup {}

--Keybinds
vim.cmd [[
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
