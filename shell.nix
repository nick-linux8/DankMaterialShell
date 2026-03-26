{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Dependencies needed at build time
  nativeBuildInputs = with pkgs; [
    go
    pkg-config
    gnumake
  ];

  # Libraries the binary needs to link against (Wayland/DBus/Qt)
  buildInputs = with pkgs; [
    wayland
    wayland-protocols
    dbus
    libglvnd # For OpenGL/Qt support
  ];

  shellHook = ''
    echo "❄️ DMS Development Environment Loaded"
    echo "Go version: $(go version)"
  '';
}
