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

sway-themes:
  git.latest:
    - target: {{ grains.homedir }}/.config/sway/base16-sway
    - name: https://github.com/rkubosz/base16-sway.git
    - force_clone: True
    - user: {{ grains.user }}

{{ grains.homedir }}/.config/i3blocks/blocklets:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

i3blocks-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3blocks/config
    - source: salt://sway/i3b-config

i3blocks-stock-blocklets:
  git.latest:
    - target: {{ grains.homedir }}/.config/i3blocks/blocklets
    - name: https://github.com/vivien/i3blocks-contrib.git
    - force_clone: True
    - user: {{ grains.user }}

i3blocks-blocklets:
  file.recurse:
    - name: {{ grains.homedir }}/.config/i3blocks/blocklets
    - source: salt://sway/blocklets
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - file_mode: 0755


