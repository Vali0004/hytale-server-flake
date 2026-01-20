{inputs, ...}: {
  nixosModules = {
    hytale-servers = import ./hytale-servers.nix inputs.self;
  };
}
