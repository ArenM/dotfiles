sway-install:
  pkg.installed:
    - pkgs:
      - sway-git
      - i3blocks

{{ grains.homedir }}/.config/sway/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}

sway-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/sway/config
    - source: salt://sway/sway-config
    - template: jinja
    - defaults:
      theme: {{ grains.theme }}
{{ grains.homedir }}/.config/i3blocks/blocklets:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

i3blocks-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3blocks/config
    - source: salt://sway/i3b-config

i3blocks-blocklets:
  file.recurse:
    - name: {{ grains.homedir }}/.config/i3blocks/blocklets
    - source: salt://sway/blocklets
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - file_mode: 0755

