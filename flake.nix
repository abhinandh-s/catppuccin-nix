{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    catppuccin = {
      frappe = import ./palette/hex/frappe.nix;
      latte = import ./palette/hex/latte.nix;
      macchiato = import ./palette/hex/macchiato.nix;
      mocha = import ./palette/hex/mocha.nix;
      bare = import ./palette/bare;
    };

    overlays.default = final: prev: {
      catppuccin = self.catppuccin;
    };

    homeManagerModules.default = { config, lib, ... }: {
      options.catppuccin = lib.mkOption {
        type = lib.types.attrs;
        readOnly = true;
        default = self.catppuccin;
        description = "Catppuccin color palette";
      };
      config = {};
    };
  };
}

