{{ grains.homedir }}/.config/rofi/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}

{{ grains.homedir }}/.config/rofi/config.rasi:
   file.managed:
    - source: salt://rofi/config.rasi
    - user: {{ grains.user }}
    - group: {{ grains.group }}

{{ grains.homedir }}/.local/bin/monitor-controls.sh:
   file.managed:
     - source: salt://rofi/monitor-controls.sh
     - user: {{ grains.user }}
     - group: {{ grains.group }}
     - mode: 755

{{ grains.homedir }}/.config/rofi/exit-sway.sh:
   file.managed:
     - source: salt://rofi/exit-sway.sh
     - user: {{ grains.user }}
     - group: {{ grains.group }}
     - mode: 755

