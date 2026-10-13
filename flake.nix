{
  description = "weebwl fork of dwl";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      pname = "weebwl";
      version = "0.1.0";
      src = self;
      nativeBuildInputs = with pkgs; [ pkg-config wayland-scanner ];
      buildInputs = with pkgs; [
        wayland
        wayland-protocols
        wlroots_0_20
        libinput
        libxkbcommon
        pixman
        libdrm
        libxcb
        libxcb-wm
        xwayland
      ];
      installPhase = ''
        install -Dm755 weebwl $out/bin/weebwl
      '';
    };
  };
}