vim-vimrc:
  file.managed:
    - name: {{ grains.homedir }}/.vimrc
    - source: salt://vim/vimrc

#vim-plug:
#  cmd.run:
#    - name:  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#    - runas: {{ grains.user }}

vim-plug:
  file.managed:
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - name: {{ grains.homedir}}/.vim/autoload/plug.vim
    - user:   {{ grains.user }}
    - group:  {{ grains.user }}

vim-plug-plugins:
  cmd.run:
    - name: vim +"PlugInstall --sync" +qa
  file.managed:
    - name:   {{ grains.homedir }}/.vim/plugged/ale/ftplugin/javascript.vim
    - source: salt://vim/ale/javascript.vim
