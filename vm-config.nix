# vm-config.nix
{ config, lib, modulesPath, pkgs, ... }: {
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/qemu-vm.nix
  imports = ["${modulesPath}/virtualisation/qemu-vm.nix"];

  environment.etc."fake-pass.txt".text = "troubleshooting";
  services.hawiki.enable = true;
  services.hawiki.passFile = "/etc/fake-pass.txt";

  # bash commands so I can actually navigate a little in the vm
  environment.systemPackages = [
    pkgs.bash
    pkgs.curl
    pkgs.coreutils
    pkgs.git
    pkgs.nginx
    pkgs.vim
  ];
  
  users.users.root.initialPassword = "root";
  users.users.root.shell = pkgs.bashInteractive;
}

