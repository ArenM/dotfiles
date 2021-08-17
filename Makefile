DESTDIR := ${HOME}

# TODO: Use install instead of cp

install: install-nvim install-sway install-terminal install-waybar install-zsh install-scripts

install-theme: install-nvim install-sway install-waybar install-terminal

env: ./base-env.sh

# TODO: Install vim-plug
install-nvim: nvim/init.nvim.tmpl
	mkdir -p ${DESTDIR}/.config/nvim/
	cp nvim/init.nvim.tmpl ${DESTDIR}/.config/nvim/init.vim
	nvim --headless +PlugInstall +qa

install-scripts: scripts/*
	# TODO: Only install some scripts on certian systems
	mkdir -p ${DESTDIR}/.local/bin
	cp scripts/* ${DESTDIR}/.local/bin

install-sway: sway/sway-config.tmpl sway/move-modes.conf.tmpl sway/background.jpg
	mkdir -p ${DESTDIR}/.config/sway
	cp sway/sway-config.tmpl ${DESTDIR}/.config/sway/config
	cp sway/move-modes.conf.tmpl ${DESTDIR}/.config/sway/move-modes.conf
	cp sway/background.jpg ${DESTDIR}/.config/sway/background.jpg
	# Git repo https://github.com/rkubosz/base16-sway.git be put at
	# ${DESTDIR}/.config/sway/base16-sway

install-terminal: install-terminal-termite install-terminal-alacritty install-terminal-foot

install-terminal-alacritty: terminal/alacritty.yml.tmpl
	mkdir -p ${DESTDIR}/.config/alacritty
	cp terminal/alacritty.yml.tmpl ${DESTDIR}/.config/alacritty/alacritty.yml

install-terminal-termite: terminal/termite.cfg.tmpl
	mkdir -p ${DESTDIR}/.config/termite
	cp terminal/termite.cfg.tmpl ${DESTDIR}/.config/termite/termite.cfg

install-terminal-foot: terminal/foot.ini.tmpl
	mkdir -p ${DESTDIR}/.config/foot
	cp terminal/foot.ini.tmpl ${DESTDIR}/.config/foot/foot.ini

install-tmux: tmux/tmux.conf.tmpl
	@if [ ! -d ${DESTDIR}/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm.git \
		${DESTDIR}/.tmux/plugins/tpm; \
	fi	
	cp tmux/tmux.conf.tmpl ${DESTDIR}/.tmux.conf

install-waybar: waybar/style.css.tmpl waybar/config
	mkdir -p ${DESTDIR}/.config/waybar
	@if [ ! -d ${DESTDIR}/.config/waybar/base16-waybar ]; then \
		git clone \
		https://github.com/mnussbaum/base16-waybar.git \
		${DESTDIR}/.config/waybar/base16-waybar; \
	fi
	cp waybar/style.css.tmpl ${DESTDIR}/.config/waybar/style.css
	cp waybar/config ${DESTDIR}/.config/waybar/config

install-zsh: zsh/zsh_plugins.txt.tmpl zsh/zshrc.zsh
	cp zsh/zsh_plugins.txt.tmpl ${DESTDIR}/.zsh_plugins
	cp zsh/zshrc.zsh ${DESTDIR}/.zshrc
	antibody bundle < "${DESTDIR}/.zsh_plugins" > "${DESTDIR}/.zsh_plugins.sh"
	antibody update

%.tmpl: % env
	./template.sh $< $@ > $@

clean:
	find . -name "*.tmpl" -exec rm {} \;
