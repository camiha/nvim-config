let $LANG='en_US.UTF-8'

if exists('g:vscode')
    " VSCode extension
 call plug#begin('~/.local/share/nvim/plugged')
 Plug 'tpope/vim-surround'
 call plug#end()

else
  set encoding=UTF-8

  set t_Co=256
  filetype plugin on
  " 全角スペースにシンタックスハイライトをかける
  "  augroup highlightIdegraphicSpace
  "    autocmd!
  "    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGree
  "    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
  "  augroup END

  set splitbelow
  set title
  set number
  set notitle
  syntax on

  " 記号などで字が潰れるのを防ぐ
  set ambiwidth=double

  " カーソルの位置を表示する
  set ruler

  " インデント周りの設定
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  set autoindent
  set smartindent

  " 入力中のコマンドを表示
  set showcmd

  " 検索結果をハイライトで表示
  set hlsearch

  " ステータスバーを表示
  set laststatus=2

  " 対応するかっこやプレースを表示
  set showmatch matchtime=1

  " 文字の削除をバックスペースでもできるようにする
  set backspace=indent,eol,start

  " 行末の1文字先までカーソルを移動できるようにする
  set virtualedit=onemore

  " スワップファイルを作成しないようにする
  set noswapfile

  " ヤンクしたテキストをクリップボードにもコピーできるようにする
  " set clipboard+=unnamed
  " set clipboard+=unnamed,autoselect

  " コマンドの補完
  set wildmenu
  set history=5000

  " terminal job fix
  tnoremap <Esc> <C-\><C-n>

  " 画面分割のキーバインドを変更
  map vsplit vs
  map split sp

  " 行を折り返さない
  set nowrap

  " インサートモード時のキーマッピング
  " ()と{}と[]と引用符の補完
  inoremap (<Enter> ()<Left>
  inoremap {<Enter> {}<Left>
  inoremap [<Enter> []<Left>
  inoremap "<Enter> ""<Left>
  inoremap '<Enter> ''<Left>
  inoremap `<Enter> ``<Left>

  inoremap {<Space> {}<Left><CR><ESC><S-o>
  inoremap [<Space> []<Left><CR><ESC><S-o>

  " ESC連打でハイライト解除
  nnoremap <Esc><Esc> :noh<CR><Esc>


  if has('vim_starting')
      " 挿入モード時に非点滅の縦棒タイプのカーソル
      let &t_SI .= "\e[6 q"
      " ノーマルモード時に非点滅のブロックタイプのカーソル
      let &t_EI .= "\e[2 q"
      " 置換モード時に非点滅の下線タイプのカーソル
      let &t_SR .= "\e[4 q"
  endif

  " theme
  let g:hybrid_use_iTerm_colors = 1
  colorscheme hybrid

  " remaps
  inoremap <silent> jk <ESC>
  " 補完表示時のEnterで改行をしない
  inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
 
  " Move current line to up/down
  " Ref: https://vim.fandom.com/wiki/Moving_lines_up_or_down
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
  " When MacOS
  " Ref: https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
  if has('macunix')
    " Option + J/K
    " ∆ == J
    " ˚ == K
    nnoremap ∆ :m .+1<CR>==
    nnoremap ˚ :m .-2<CR>==
    inoremap ∆ <Esc>:m .+1<CR>==gi
    inoremap ˚ <Esc>:m .-2<CR>==gi
    vnoremap ∆ :m '>+1<CR>gv=gv
    vnoremap ˚ :m '<-2<CR>gv=gv
  endif
 
  let mapleader = ","

 
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight LineNr ctermbg=none
  highlight Folded ctermbg=none
  highlight EndOfBuffer ctermbg=none

  " --------------------------------
  " Plugins Settings
  " --------------------------------
  call plug#begin('~/.local/share/nvim/plugged')
    " Basics
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'Yggdroot/indentLine'

    " Nerd Fonts
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'

    " status line
    Plug 'itchyny/lightline.vim'

    " fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    " file tree
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'yuki-yano/fern-preview.vim'

    " git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    
    " lsp
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'lepture/vim-jinja'

    " linter and formatter
    " Plug 'dense-analysis/ale'

    " utility
    Plug 'mattn/emmet-vim'
    Plug 'cohama/lexima.vim'

  call plug#end()   
  
  " --------------------------------
  " Nerd Fonts Settings
  " --------------------------------
  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END

  " --------------------------------
  " Telescope Settings
  " --------------------------------
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  " --------------------------------
  " Fern Settings
  " --------------------------------
  let g:fern#renderer = "nerdfont"

  " --------------------------------
  " CoC Settings
  " --------------------------------
  " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
  " unicode characters in the file autoload/float.vim
  set encoding=utf-8

  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ CheckBackspace() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

  " --------------------------------
  " ALE Settings
  " --------------------------------
endif


