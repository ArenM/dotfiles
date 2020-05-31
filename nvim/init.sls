{{ grains.homedir }}/.config/nvim/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mkdirs: True
nvim-init:
  file.managed:
    - name: {{ grains.homedir }}/.config/nvim/init.vim
    - source: salt://nvim/vimrc
    - template: jinja
    - defaults:
      theme: {{ grains.theme }}

nvim-plug:
  cmd.run:
    - name: 'mkdir -p "{{ grains.homedir }}/.local/share/nvim/site/autoload/"; chown {{grains.user}}:{{grains.group}} "{{grains.homedir}}/.local/share/nvim"'
  file.managed:
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - name: {{ grains.homedir}}/.local/share/nvim/site/autoload/plug.vim
    - skip_verify: True
    - user:   {{ grains.user }}
    - group:  {{ grains.group }}

nvim-plug-plugins:
  cmd.run:
    - name: nvim +"PlugInstall --sync" +qa
