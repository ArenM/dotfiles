{ pkgs, ... }:

with pkgs;
{
    home.packages = with pkgs; [
        # Graphical Basics
        hicolor-icon-theme

        # General Tools
        aerc pavucontrol
        nextcloud-client
        tokei tree
        direnv
        imv sshfs-fuse
        w3m unzip
        file libqalculate # for qalc command
        tealdeer # tldr command

        # Graphical Tools
        slic3r zathura
        firefox simple-scan

        # Monitoring
        iotop bandwhich
        nethogs ncdu

        # Misc
        aircrack-ng
        sshuttle
        font-awesome
        hack-font

        # appimage-run # Here to test if appimages work with it installed, not to stay

        # General Development Environment
        clang
        pkg-config
        waybar
        mutagen
        silver-searcher

        # Zsh
        antibody starship
        zsh-history-substring-search

        # Rust Development
        # cargo
        # rls
    ];

    nixpkgs.config.packageOverrides = pkgs: {
        waybar = pkgs.waybar.override {
            traySupport = true;
            pulseSupport = true;
        };
    };

    fonts.fontconfig.enable = true;

    programs.git = {
        enable = true;
    };

    services.gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        # TODO: Add the following to ~/.pam_environment
        # SSH_AGENT_PID	DEFAULT=
        # SSH_AUTH_SOCK	DEFAULT="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
        enableSshSupport = true;
    };

    services.gnome-keyring = {
        enable = true;
        components = [ "secrets" ];
    };

    services.redshift = {
        enable = true;
        package = pkgs.redshift-wlr;
        provider = "geoclue2";
        temperature.night = 2300;
    };

    services.syncthing = {
        enable = true;
    };
}
