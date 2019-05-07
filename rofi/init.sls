{{ grains.homedir}}/config/rofi/:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.use }}

{{ grains.homedir }}/config/rofi/config.rasi
   file.managed:
     source: salt://rofi/config.rasi
