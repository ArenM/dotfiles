{{ grains.homedir }}/.config/alacritty:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}

{{ grains.homedir }}/.config/alacritty/alacritty.yml:
  file.managed:
    - source: salt://terminal/alacritty.yml
    - template: jinja
    - default:
      base16theme: {{grains.theme}}

{{ grains.homedir }}/.config/termite/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}

{{ grains.homedir }}/.config/termite/config:
  file.managed:
    - source: salt://terminal/termite.cfg
    - template: jinja
    - default:
      base16theme: {{grains.theme}}
