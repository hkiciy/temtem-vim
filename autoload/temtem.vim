vim9script

export def Temtem(arg: string)
    LoadTemplate(arg)
enddef

export def LoadTemplate(filename: string): void
    const template_path = g:temtem_template_basepath .. '/' .. &filetype .. '/' .. filename

    if filereadable(expand(template_path))
        execute ':-1read' template_path
        if search('${@}', 'c') > 0
            noautocmd normal! 4"_x
        endif
    endif
enddef

export def GetFilenames(arg: string, line: string, pos: number): list<string>
    const path = expand(g:temtem_template_basepath) .. &filetype
    const files = readdir(path, (x) => x =~ '.txt$')
    return files
enddef
