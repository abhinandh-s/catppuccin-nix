{
  description = "A very basic flake";

  inputs = { };

  outputs = { self }: {
    catppuccin = {
      latte = import ./palette/hex/latte.nix;
      frappe = import ./palette/hex/frappe.nix;
      macchiato = import ./palette/hex/macchiato.nix;
      mocha = import ./palette/hex/mocha.nix;
      bare = import ./palette/bare;
      hex = import ./palette/hex;
      rgb = import ./palette/rgb;
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
