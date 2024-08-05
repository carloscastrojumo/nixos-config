{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # environment.systemPackages = [
  #   inputs.ghostty.packages.${pkgs.stdenv.system}.default
  # ];

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.carloscastro = {
    isNormalUser = true;
    home = "/home/carloscastro";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$EyGEw4Xm3c30LgVC$2mOiQC1qdWD6j1gfWERXIaWToApldmOvLR8pbkpCf3uC.IiCqHedQa3KT3M35bP4ifnrJqnKJroVPiPlslg76/";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAB7rYpzq58e2txHX9Q0TQWWlZVQ9k9ChOX0/B2o3EFRi9XcJArjJttD17VmQ4YA8LWZVWUBZkDFHJMhvezSXnQgc0nY4Bd0HOEHkeZnI5hL/eGt6BjtaIFpI3uhlBYGdJuROICaln7UG5y2tesOELG3HwfgQEEI1HwghHeELl6Te7xbLAcIKFQZK/0Uv5e8a8NaBQ9zzWwDcFvcFFoGG6epCsVFLDTtEULwO3d++Ie/hTvkHRCjo75wfhzUwf7ylFgwkEbj36ky8oXH5Spwk9en+Z4/fy7vGWZ2myd/dsdlNr1sHRjEMjT7Pe4TkmtHHMP70xKGTs15Y6SJZCMpUI/5cZXk93tSESEKEZzXnAyjAExDIois7/k8NwsqYfDTw4BlfLrVMTYWnbtcH0CapCJKvB1Lwz772HULuGIH/qDEGV04usDbjuaJYUzQ5G7ILeK/ie1MezaPuLCJZZSyxe56lIL9/eky9JXhNovwhsSOdrKdmIYSupgCsxgoHY8zs= carloscastro@LHHD2XQXV2"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
