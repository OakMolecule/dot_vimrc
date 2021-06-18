call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/L9'

" 主题
Plug 'tomasr/molokai'
Plug 'liuchengxu/space-vim-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'hzchirs/vim-material'

" Plugin: Encoding
Plug 'mbbill/fencview', {'on': 'FencAutoDetect'}

" Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-signify'                  " 对比当前文本和 git/svn 仓库里的版本
Plug 'dense-analysis/ale'
"Plug 'Lokaltog/vim-powerline'             " 控制台插件
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }   " C/C++语法高亮插件
Plug 'Mizuchi/STL-Syntax'                 " STL语法高亮插件
" Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/LeaderF'
Plug 'nathanaelkane/vim-indent-guides'    " 代码缩进高亮插件
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " 工程文件浏览
Plug 'scrooloose/nerdcommenter'           " 快速注释插件
Plug 'jistr/vim-nerdtree-tabs'            " 可以使 nerdtree 的 tab 更加友好些
"Plug 'fholgado/minibufexpl.vim'           " 多文档编辑
Plug 'jiangmiao/auto-pairs'               " 自动补全括号的插件，包括小括号，中括号，以及花括号
" Plug 'iamcco/markdown-preview.vim'
" Plug 'mzlogin/vim-markdown-toc'
Plug 'fatih/vim-go', { 'tag': '*', 'for': 'go' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

Plug 'Xuyuanp/nerdtree-git-plugin'        " 可以在导航目录中看到 git 版本信息

" 下面两个插件要配合使用，可以自动生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'skywind3000/asyncrun.vim'           " vim 底部自动编译运行

Plug 'vim-scripts/indexer.tar.gz'                     " tags文件自动更新插件
Plug 'vim-scripts/DfrankUtil'                         " indexer.tar.gz插件依赖插件
Plug 'vim-scripts/Vimprj'                             " indexer.tar.gz插件依赖插件

Plug 'majutsushi/tagbar'                  " 标签列表插件
Plug 'ludovicchabant/vim-gutentags'       " 自动生成ctags

" 底部信息栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mileszs/ack.vim'                    " quik find

Plug 'wakatime/vim-wakatime'              " 统计代码量

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'Chiel92/vim-autoformat'             " auto format
" Plug 'aperezdc/vim-template'

Plug 'chxuan/cpp-mode'                    " 提供生成函数实现、函数声明/实现跳转、.h .cpp切换等功能

Plug 'rhysd/clever-f.vim'

Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/a.vim'

" 快速重构插件
Plug 'terryma/vim-multiple-cursors'

" markdown插件
"Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
"Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()

" 启动语法高亮
syntax enable
syntax on
" 设置颜色主题
colorscheme molokai
" 显示行号
set number
set smartindent
set backspace=2

" 设置tab为4个空格
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
" 结束设置tab为空格

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" w!! to sudo & write a file
cmap w!! w !sudo tee > /dev/null %

" 搜索
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,big5,euc-jp,euc-kr,latin1

" Show already typed keys when more are expected.
set showcmd

" 显示不可打印的字符。
set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

"恢复上次光标位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 保存自动格式化
" au BufWrite * :Autoformat

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>

" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_goto_buffer_command = 'vertical-split'
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_invoke_completion = '<c-space>'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<TAB>']
" 使用syntastic检查语法
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_error_symbol='✗'
let g:ycm_warning_symbol='⚠'


map <F3> :tabnew .<CR>
map <C-j> :YcmCompleter GoToDefinition<CR>
nmap <leader>gl :YcmCompleter GoToDeclaration<CR>

nmap <F6> :TagbarToggle<cr>
nmap <F5> :NERDTreeToggle<cr>
" nnoremap <leader>gi :YcmCompleter GoToImprecise<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
" 不显示隐藏文件
let g:NERDTreeHidden=0
" 过滤: 所有指定文件和文件夹不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__', '.ycm_extra_conf.py', '\.git']


" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" Powerline
"let g:Powerline_symbols = 'fancy'
"set laststatus=2
"set encoding=utf-8

" airline
let g:airline_theme="molokai"
"let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <F4> :bn<CR>

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

"highlight Functions
"syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
"syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cFunctions gui=NONE cterm=bold  ctermfg=blue


"-------- -------- -------- -------- -------- --------
"vim-markdown
"-------- -------- -------- -------- -------- --------
" set chrome path
let g:mkdp_path_to_chrome = "google-chrome-stable"
" 设置不自动打开chrome预览
let g:mkdp_auto_start = 0
" set to 1: 检查预览窗口是否打开，否则自动打开
let g:mkdp_auto_open = 0
" 在切换buffer的时候自动关闭预览窗口
let g:mkdp_auto_close = 0
" real-time preview
let g:mkdp_refresh_slow = 0

" vim-easymotion
let g:EasyMotion_smartcase = 1
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" LeaderF
"nnoremap <C-p> :LeaderfFile ~<cr>
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y
" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p
" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

""""""""""""""
" gutentags
""""""""""""""
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
""""""""""""""
" end gutentags
""""""""""""""


""""""""""""""
" asyncrun
""""""""""""""
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
nnoremap <silent> <F7> :AsyncRun -cwd=<svn> ./axsec_build.sh -b <cr>
""""""""""""""
" end asyncrun
""""""""""""""

""""""""""""""
" ale
""""""""""""""
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
""""""""""""""
" end ale
""""""""""""""

