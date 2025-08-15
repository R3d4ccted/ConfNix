{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos-vm";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    password = "nixos";
  };
  environment.systemPackages = with pkgs; [
    vim
    firefox
    git
    wget
    curl
    neofetch
    wine
    steam
    vscode
  ];
  security.sudo.enable = true;
  hardware.opengl.enable = true;
  virtualisation.vmware.guest.enable = true;
}
