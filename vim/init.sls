vim-vimrc:
  file.managed:
    - name: {{ grains.homedir }}/.vimrc
    - source: salt://vim/vimrc

vim-ale:
  file.managed:
    - name: {{ grains.homedir }}/.vim/plugged/ale/ftplugin/javascript.vim
    - source: salt://vim/ale/javascript.vim
