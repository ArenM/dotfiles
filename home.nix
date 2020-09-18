{ pkgs, ... }:

with pkgs;
{
    home.packages = with pkgs; [
        # General Tools
        aerc pavucontrol        
        nextcloud-client
        tokei tree
        nethogs direnv 
        imv sshfs-fuse
        file libqalculate # for qalc command
        tealdeer # tldr command

        # Graphical Tools
        slic3r
        firefox

        # Misc
        aircrack-ng
        sshuttle
        font-awesome
        hack-font
        
        appimage-run # Here to test if appimages work with it installed, not to stay

        # General Development Environment
        clang
        pkg-config
        waybar
        mutagen

        # Zsh
        antibody starship

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

    programs.git = {
        enable = true;
    };

    services.gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
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
