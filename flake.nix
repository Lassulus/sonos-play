{
  description = "just play sonos, $1 is sonos ctrl url, $2 is http url of radio stream";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "i686-linux"
        "aarch64-linux"
        "riscv64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.writers.writePython3Bin "sonos-play" {
            libraries = [ pkgs.python3Packages.pysonos ];
          } ./just-play.py;
        }
      );
    };
}
