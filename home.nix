{ lib, pkgs, inputs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    xdg.configFile."fastfetch" = {
        source = ./fastfetch;
        force = true;
    };

    services.flatpak = {
        enable = true;
        remotes = [
            {
                name = "flathub";
                location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
        ];
        packages = [
            "com.usebottles.bottles"
            "com.vysp3r.ProtonPlus"
            "net.lutris.Lutris"
            "com.heroicgameslauncher.hgl"
            "sh.ppy.osu"
            "app.zen_browser.zen"
            "org.vinegarhq.Sober"
            "com.rtosta.zapzap"
            "com.github.tchx84.Flatseal"
        ];
        uninstallUnmanaged = true;
        update.onActivation = false;
    };

    home = {
        packages = with pkgs; [
        #Sistema normal
        gnumake
        atool
        httpie
        kew
        fastfetch
        zed-editor
        btop
        qbittorrent
	    discord
	    vscode
		dolphin-emu

        #Dev
        nodejs
        wget
        curl
        git
        neovim

        #c++
        gdb
        clang
        llvmPackages.clang-tools
        cmake

        #python y pip
        (python3.withPackages (ps: with ps; [
            pip
            virtualenv
        ]))

        #java
        jdk21
        maven
        gradle

        #BBDD
        postgresql
        mariadb
        sqlite
        dbeaver-bin

        #Arduino y esp32
        picocom
        minicom
        arduino-cli
        esptool
        ];

        username = "l1ghtr";
        homeDirectory = "/home/l1ghtr/";
        stateVersion = "26.05";

      };
      programs.bash.enable = true;
      programs.zsh = {
        enable = true;
        enableCompletion = true;

        oh-my-zsh = {
            enable = true;
            theme = "intheloop";
            plugins = [
                "git"
                "sudo"
                "colored-man-pages"
            ];
        };
    };
  }
