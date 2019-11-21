{{ grains.homedir }}/.config/gtk-3.0/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}

zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.config/gtk-3.0/settings.ini
    - source: salt://gtk/settings.ini

