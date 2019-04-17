deps:
  pkg.installed:
    - pkgs:
      - zsh
      - antibody

zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh

zsh-plugins:
  file.managed:
    - name: {{ grains.homedir }}/.zsh_plugins
    - source: salt://zsh/zsh_plugins.txt
