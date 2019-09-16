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

