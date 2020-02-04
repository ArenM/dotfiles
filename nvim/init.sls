{{ grains.homedir }}/.config/nvim/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mkdirs: True
nvim-init:
  file.managed:
    - name: {{ grains.homedir }}/.config/nvim/init.vim
    - source: salt://nvim/vimrc

nvim-plug:
  cmd.run:
    - name: 'mkdir -p "{{ grains.homedir }}/.local/share/nvim/site/autoload/"; chown {{grains.user}}:{{grains.user}} "{{grains.homedir}}/.local/share/nvim"'
  file.managed:
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - name: {{ grains.homedir}}/.local/share/nvim/site/autoload/plug.vim
    - skip_verify: True
    - user:   {{ grains.user }}
    - group:  {{ grains.group }}

nvim-plug-plugins:
  cmd.run:
    - name: nvim +"PlugInstall --sync" +qa
#{{ grains.homedir }}/.vim/plugged/ale/ftplugin/javascript.vim:
#  file.managed:
#    - source: salt://nvim/ale/javascript.vim
#{{ grains.homedir }}/.vim/plugged/ale/ftplugin/python.vim:
#  file.managed:
#    - source: salt://nvim/ale/python.vim
#{{ grains.homedir }}/.vim/plugged/ale/ftplugin/vue.vim:
#  file.managed:
#    - source: salt://nvim/ale/vue.vim
#{{ grains.homedir }}/.vim/plugged/ale/ftplugin/html.vim:
#  file.managed:
#    - source: salt://nvim/ale/html.vim
#{{ grains.homedir }}/.vim/plugged/ale/ftplugin/css.vim:
#  file.managed:
#    - source: salt://nvim/ale/css.vim

