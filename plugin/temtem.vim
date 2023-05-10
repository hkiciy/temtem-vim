vim9script

if v:version < 900 || exists('g:loaded_temtem')
    finish
endif

var default_path = '~/.vim/config/temtem/'
if has('win32')
    default_path = '~/vimfiles/config/temtem/'
endif

g:loaded_temtem = true
g:temtem_template_basepath = get(g:, 'temtem_template_basepath', default_path)

command! -nargs=1 -complete=customlist,temtem#GetFilenames Temtem temtem#Temtem(<q-args>)

augroup temtem
    autocmd!
    autocmd BufNewFile * temtem#LoadTemplate('default.txt')
augroup END
