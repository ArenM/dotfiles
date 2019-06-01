{{ grains.homedir }}/.config/rofi/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}

{{ grains.homedir }}/.config/rofi/config.rasi:
   file.managed:
    - source: salt://rofi/config.rasi
    - user: {{ grains.user }}
    - group: {{ grains.user }}

{{ grains.homedir }}/.config/rofi/exit-sway.sh:
   file.managed:
     - source: salt://rofi/exit-sway.sh
     - user: {{ grains.user }}
     - group: {{ grains.user }}
     - mode: 755

