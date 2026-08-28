.PHONY: switch update
switch:
	nix run github:nix-community/home-manager -- switch --flake .#myprofile

update:
	nix flake update
nix run github:nix-community/home-manager -- switch --flake .#myprofile
