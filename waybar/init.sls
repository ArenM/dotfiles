{{ grains.homedir }}/.config/waybar/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}

{{ grains.homedir }}/.config/waybar/config:
  file.managed:
    - source: salt://waybar/config
    - template: jinja
    - defaults:
      theme: {{ grains.theme }}

{{ grains.homedir }}/.config/waybar/style.css:
  file.managed:
    - source: salt://waybar/style.css
    - template: jinja
    - defaults:
      theme: {{ grains.theme }}

sway-themes:
  git.latest:
    - target: {{ grains.homedir }}/.config/waybar/base16-waybar
    - name: https://github.com/mnussbaum/base16-waybar.git
    - force_clone: True
    - user: {{ grains.user }}

