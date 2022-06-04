function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction

function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
    set showtabline=0
    set laststatus=0
    set guifont=Iosevka\ Term:h10:r
  endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
au BufEnter github.com_*.txt filetype=markdown
au BufEnter localhost_lab_*.txt set filetype=python

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://[^/]*google.com/*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://[^/]*reddit.com/*'] = { 'takeover': 'never', 'priority': 1 }

