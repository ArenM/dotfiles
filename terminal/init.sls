terminal-config-dir:
  file.directory:
    - name: {{ grains.homedir }}/.config/alacritty
    - user: {{ grains.user }}
    - group: {{ grains.group }}

terminal-config-file:
  file.managed:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - source: salt://terminal/alacritty.yml
    - template: jinja
    - default:
      base16theme: {{grains.theme}}

{{ grains.homedir }}/.config/termite/config:
  file.managed:
    - source: salt://terminal/termite.cfg
    - template: jinja
    - default:
      base16theme: {{grains.theme}}
