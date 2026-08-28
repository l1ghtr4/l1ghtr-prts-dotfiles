bueno, para sea quien sea que este viendo estos dotfiles, esta es mi primera vez haciendo unos dotfiles para nixos.
espero les funcione :)

como usarlo:

1 - Primero crea un backup de tu configuration.nix otriginal, despues crea un enlace entre el configuration.nix del repositorio al directorio del original.

sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak

ln -s "$PWD/configuration.nix" /etc/nixos/configuration.nix

2 - Despues de esto ejecuta, despues de ejecutarlo, reinicia el pc:
nixos-rebuild switch

3 - En el terminal dirígete hacia el directorio de los archivos del repositorio y ejecuta esto:

make update (para actualizar el flake)
make switch (para instalar los archivos)