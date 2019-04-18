earlyoom-install:
  {% if grains['os_family'] == 'Arch' %}
  cmd.run:
    - name: yay -Sq --noconfirm --needed earlyoom
    - runas: {{ grains.user }}
  {% else %}
  pkg.installed:
    - pkgs:
      - earlyoom
  {% endif %}

earlyoom-config:
  file.managed:
    - name: /etc/default/earlyoom
    - source: salt://earlyoom/config
