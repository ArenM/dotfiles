DESTDIR := ${HOME}

# TODO: Use install instead of cp

install: install-zsh install-nvim

# TODO: Install vim-plug
install-nvim: build/nvimrc
	mkdir -p ${DESTDIR}/.config/nvim/
	cp build/nvimrc ${DESTDIR}/.config/nvim/init.vim

install-zsh: build/zsh_plugins
	cp build/zsh_plugins.txt ${DESTDIR}/.zsh_plugins
	cp zsh/zshrc.zsh ${DESTDIR}/.zshrc

install-waybar: build/style.css
	cp build/style.css ${DESTDIR}/.config/waybar/style.css
	cp waybar/config ${DESTDIR}/.config/waybar/config

build/style.css: waybar/style.css
	./template.sh waybar/style.css > build/style.css

build/nvimrc: nvim/vimrc
	./template.sh nvim/vimrc > build/nvimrc

build/zsh_plugins: zsh/zsh_plugins.txt
	./template.sh zsh/zsh_plugins.txt > build/zsh_plugins.txt
