{ config, pkgs, ... }:

{
  imports = [ 
  <nixpkgs/nixos/modules/virtualisation/virtualbox-image.nix> 
  <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix> 
  <nixpkgs/nixos/modules/profiles/graphical.nix> 
  <nixpkgs/nixos/modules/profiles/clone-config.nix> 
];


nixpkgs.config.allowUnfree = true;

users = {
  mutableUsers = false;

  users = {
   root = {
     	   hashedPassword = "$6$kjrAmXVLTLXA2Ae$KQQUah2hczFJmgtdO6uZAG1NL/H6QiWu4S0jxFZBwfUjPHIxLrIy9Ys5bxJxqCcYpjvDG8pdK9t8oVqwu7vK.0";
    };
  };
  
  extraUsers = {
   zaccaria = {
	   isNormalUser = true;
	   home = "/home/zaccaria";
	   description = "Vittorio Zaccaria";
	   extraGroups = [ "wheel" "networkmanager" ];
	   hashedPassword = "$6$kjrAmXVLTLXA2Ae$KQQUah2hczFJmgtdO6uZAG1NL/H6QiWu4S0jxFZBwfUjPHIxLrIy9Ys5bxJxqCcYpjvDG8pdK9t8oVqwu7vK.0";
  };
 };
};

nix.trustedUsers = [ "zaccaria" ];

services.xserver.displayManager.sddm.autoLogin = {
    enable = true;
    relogin = true;
    user = "zaccaria";
};

# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.xserver.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome3.enable = true;

# Set your time zone.
time.timeZone = "Europe/Rome";

# List packages installed in system profile. To search, run:
# \$ nix search wget

 environment.systemPackages = with pkgs; [
    wget 
    vim 
    neovim 
    google-chrome 
    zsh
    git
  ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}
