{inputs, ...}: let
  callTest = path: pkgs: import path {inherit inputs pkgs;};
in {
  checks = {
    server-files = pkgs: callTest ./server-files.nix pkgs;
  };
}
