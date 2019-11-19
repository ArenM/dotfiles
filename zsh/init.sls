zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh

zsh-plugins:
  file.managed:
    - name: {{ grains.homedir }}/.zsh_plugins
    - source: salt://zsh/zsh_plugins.txt

zsh-antibody:
  cmd.run:
    - name: antibody bundle < "$HOME/.zsh_plugins" > "$HOME/.zsh_plugins.sh"
    - runas: {{ grains.user }}
