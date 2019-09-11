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

{{ grains.homedir }}/.config/termite/config:
  file.managed:
    - source: salt://terminal/termite.cfg
    - template: jinja
    - default:
      base16theme: {{grains.theme}}
