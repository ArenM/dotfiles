zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh

zsh-plugins:
  file.managed:
    - name: {{ grains.homedir }}/.zsh_plugins
    - source: salt://zsh/zsh_plugins.txt

zsh-powerlevel-config:
  file.managed:
    - name: {{ grains.homedir }}/.p10k.zsh
    - source: salt://zsh/p10k.zsh

zsh-antibody-update:
  cmd.run:
    - name: antibody update
    - runas: {{ grains.user }}

zsh-antibody-build:
  cmd.run:
    - name: antibody bundle < "$HOME/.zsh_plugins" > "$HOME/.zsh_plugins.sh"
    - runas: {{ grains.user }}
