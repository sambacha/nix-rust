{ project ? import ./nix { }
}:

project.pkgs.mkShell {
  buildInputs = builtins.attrValues project.devTools;
  shellHook = ''
    ${project.ci.pre-commit-check.shellHook}
  '';
}

let
  rust = import ../nix/rust.nix;
in rust.shell ./rust-toolchain
