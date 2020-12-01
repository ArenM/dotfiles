{{ grains.homedir }}/.config/sway/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}

sway-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/sway/config
    - source: salt://sway/sway-config
    - template: jinja
    - defaults:
      theme: {{ grains.theme }}
      gtk_theme: {{ grains.gtk_theme }}
      terminal: {{ 'alacritty' if grains.gles3 else 'termite' }}
      home: {{ grains.homedir }}

sway-background:
  file.managed:
    - name: {{ grains.homedir }}/.config/sway/background.jpg
    - source: salt://sway/background.jpg

sway-themes:
  git.latest:
    - target: {{ grains.homedir }}/.config/sway/base16-sway
    - name: https://github.com/rkubosz/base16-sway.git
    - force_clone: True
    - user: {{ grains.user }}

{{ grains.homedir }}/.config/i3blocks/blocklets:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}
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
    - group: {{ grains.group }}
    - file_mode: 0755


