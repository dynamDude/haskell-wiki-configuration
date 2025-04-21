# vm-config.nix
{ config, lib, modulesPath, pkgs, ... }: {
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix
  imports = ["${modulesPath}/virtualisation/qemu-vm.nix"];

  services.hawiki.enable = true;
  services.hawiki.passFile = "/etc/fake-pass.txt";

  users.users.root.initialPassword = "root";
}
