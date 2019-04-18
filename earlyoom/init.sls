earlyoom-install:
  pkg.installed:
    - pkgs:
      - earlyoom

earlyoom-config:
  file.managed:
    - name: /etc/default/earlyoom
    - source: salt://earlyoom/config
