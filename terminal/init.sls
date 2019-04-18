terminal-install:
  pkg.installed:
    - pkgs:
      - alacritty

terminal-config-dir:
  file.directory:
    - name: {{ grains.homedir }}/.config/alacritty
    - user: {{ grains.user }}
    - group: {{ grains.user }}

terminal-config-file:
  file.managed:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - source: salt://terminal/alacritty.yml
