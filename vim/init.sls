vim-vimrc:
  file.managed:
    - name: {{ grains.homedir }}/.vimrc
    - source: salt://vim/vimrc

vim-plug:
  file.managed:
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - name: {{ grains.homedir}}/.vim/autoload/plug.vim
    - skip_verify: True
    - user:   {{ grains.user }}
    - group:  {{ grains.user }}

# TODO: install pynvim

vim-plug-plugins:
  cmd.run:
    - name: vim +"PlugInstall --sync" +qa
{{ grains.homedir }}/.vim/plugged/ale/ftplugin/javascript.vim:
  file.managed:
    - source: salt://vim/ale/javascript.vim
{{ grains.homedir }}/.vim/plugged/ale/ftplugin/python.vim:
  file.managed:
    - source: salt://vim/ale/python.vim
{{ grains.homedir }}/.vim/plugged/ale/ftplugin/vue.vim:
  file.managed:
    - source: salt://vim/ale/vue.vim

