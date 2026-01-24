# shell.nix
{
    pkgs ? import <nixpkgs> { },
}:

let
    buildInputs = with pkgs; [
        pkg-config
        wayland
        wayland-protocols
        libxkbcommon
        libinput
        seatd
        systemd
        libgbm
        libdrm
        libglvnd
        libGL
        libdisplay-info_0_2
        # libdisplay-info
        pixman
        (systemd.dev)
    ];
in
pkgs.mkShell {
    inherit buildInputs;

    shellHook = ''
        export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH
    '';
}
