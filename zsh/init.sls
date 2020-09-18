zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh

zsh-plugins:
  file.managed:
    - name: {{ grains.homedir }}/.zsh_plugins
    - source: salt://zsh/zsh_plugins.txt
    - template: jinja
    - defaults:
      terminal: {{ 'alacritty' if grains.gles3 else 'termite' }}

zsh-antibody-update:
  cmd.run:
    - name: antibody update
    - runas: {{ grains.user }}

zsh-antibody-build:
  cmd.run:
    - name: antibody bundle < "$HOME/.zsh_plugins" > "$HOME/.zsh_plugins.sh"
    - runas: {{ grains.user }}
