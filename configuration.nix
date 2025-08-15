{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  system.stateVersion = "25.05";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  users.users.user = {
    isNormalUser = true;
    description = "kurond";
    extraGroups = [ "wheel" "networkmanager" ];
    password = "12345";
  };
  security.sudo.wheelNeedsPassword = false;
  environment.systemPackages = with pkgs; [
    firefox
    vscode
    git
    curl
    wget
    gnome-terminal
    dconf-editor
  ];

  hardware.graphics.enable = true;
  services.printing.enable = true;
  services.flatpak.enable = true;
  networking.firewall.enable = true;
}
