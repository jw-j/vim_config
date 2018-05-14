#!/bin/bash
echo "
let g:signature = \"Demo <demo@demo.com>\"
if (has(\"win32\") || has(\"win95\") || has(\"win64\") || has(\"win16\"))
    let g:mysystem = \"windows\"
elseif has(\"mac\")
    let g:mysystem = \"mac\"
elseif has(\"unix\")
    let g:mysystem = \"unix\"
else
    let g:mysystem = \"\"
endif
if g:mysystem == \"windows\"
    set runtimepath+=~/_vim_config/,~/_vim_config/after/
    source ~/_vim_config/vimrc
    \"helptags ~/_vim_config/doc/
else
    set runtimepath+=~/.vim_config/,~/.vim_config/after/
    source ~/.vim_config/vimrc
    \"helptags ~/.vim_config/doc/
endif
" > ~/.vimrc
echo "Installed libGod vim configuration successfully! Enjoy :)"
