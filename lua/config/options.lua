-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

--行号
opt.relativenumber = true
opt.number = true

--缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartcase = true

--防止包裹
opt.wrap = false

--光标行
opt.cursorline = true

--启用鼠标
opt.mouse:append("a")

--系统剪贴板
opt.clipboard:append("unnamedplus")

--默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

--搜索
opt.ignorecase = true
opt.smartcase = true

--外观
opt.termguicolors = true
opt.signcolumn = "yes"

vim.o.showtabline = 2
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.list = true
vim.o.pumheight = 10
vim.o.listchars = "space:·"

--主题
-- local colorscheme = "gruvbox"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
--   return
-- end

vim.cmd([[
autocmd BufNewFile *.cpp,*.[ch],*.java,*.go,*.rs,  exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
"如果文件类型为.sh文件
if &filetype == 'py'
call setline(1,"#########################################################################")
call append(line("."),   "# Files Name:    ".expand("%"))
call append(line(".")+1, "# Author:       Luffy")
call append(line(".")+2, "# mail:         534324634@qq.com")
call append(line(".")+3, "# Created Time: ".strftime("%c"))
call append(line(".")+4, "#########################################################################")
call append(line(".")+5, "#!/bin/bash")
call append(line(".")+6, "")
else
call setline(1, "/* ************************************************************************")
call append(line("."),   "File Name:     ".expand("%"))
call append(line(".")+1, "Author:        Luffy")
call append(line(".")+2, "Mail:          534324634@qq.com")
call append(line(".")+3, "Created Time:  ".strftime("%c"))
call append(line(".")+4, "************************************************************************/")
call append(line(".")+5, "")
endif
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
endfunc
]])

vim.cmd([[
autocmd BufNewFile *.h,*.hpp,*.c exec ":call AddHHeader()"
func AddHHeader()
let macro = "_".toupper(substitute(expand("%"), "[/.]", "_", "g"))."_"
"normal o
call setline(9, "#ifndef ".macro)
call setline(10, "#define ".macro)
call setline(11, "")
call setline(12, "#endif  // ".macro)
endfunc
]])

-- 保存指针位置
vim.cmd([[
  if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g'\"" |
  \ endif
  endif
]])

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>r",
      -- "<ESC>:w<CR>:split<CR>:te g++ -std=c++20 -pthread -Wall -o ./%:t:r % -g && ./%:t:r<CR>i",
      "<ESC>:w<CR>:split<CR>:te g++ -std=c++20 -pthread -Wall -o a.out % -g && ./a.out<CR>i",
      { silent = true, noremap = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>r",
      -- "<ESC>:w<CR>:split<CR>:te gcc -lm -std=c2x -pthread -Wall -o a.out % -g && ./a.out<CR>i",
      "<ESC>:w<CR>:split<CR>:te g++ -std=c++20 -pthread -Wall -o a.out % -g && ./a.out<CR>i",
      { silent = true, noremap = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>r",
      "<ESC>:w<CR>:split<CR>:te python3 ./% <CR>i",
      { silent = true, noremap = true }
    )
  end,
})
