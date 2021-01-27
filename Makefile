DESTDIR := ${HOME}

# TODO: Use install instead of cp

install: install-nvim install-sway install-terminal install-waybar install-zsh

env: ./base-env.sh

# TODO: Install vim-plug
install-nvim: build/nvimrc
	mkdir -p ${DESTDIR}/.config/nvim/
	cp build/nvimrc ${DESTDIR}/.config/nvim/init.vim

install-sway: build/sway-config sway/background.jpg
	mkdir -p ${DESTDIR}/.config/sway
	cp build/sway-config ${DESTDIR}/.config/sway/config
	cp sway/background.jpg ${DESTDIR}/.config/sway/background.jpg
	# Git repo https://github.com/rkubosz/base16-sway.git be put at
	# ${DESTDIR}/.config/sway/base16-sway

install-terminal: build/alacritty.yml build/termite.cfg
	mkdir -p ${DESTDIR}/.config/alacritty
	cp build/alacritty.yml ${DESTDIR}/.config/alacritty/alacritty.yml
	mkdir -p ${DESTDIR}/.config/termite
	cp build/termite.cfg ${DESTDIR}/.config/termite/termite.cfg

install-waybar: build/style.css waybar/config
	cp build/style.css ${DESTDIR}/.config/waybar/style.css
	cp waybar/config ${DESTDIR}/.config/waybar/config

install-zsh: build/zsh_plugins zsh/zshrc.zsh
	cp build/zsh_plugins.txt ${DESTDIR}/.zsh_plugins
	cp zsh/zshrc.zsh ${DESTDIR}/.zshrc

build/alacritty.yml: terminal/alacritty.yml env
	./template.sh terminal/alacritty.yml > build/alacritty.yml

build/nvimrc: nvim/vimrc env
	./template.sh nvim/vimrc > build/nvimrc

build/style.css: waybar/style.css env
	./template.sh waybar/style.css > build/style.css

build/sway-config: sway/sway-config env
	./template.sh sway/sway-config > build/sway-config

build/termite.cfg: terminal/termite.cfg env
	./template.sh terminal/termite.cfg > build/termite.cfg

build/zsh_plugins: zsh/zsh_plugins.txt env
	./template.sh zsh/zsh_plugins.txt > build/zsh_plugins.txt
