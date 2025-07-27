{
  description = "A flake for Catppuccin color palette";

  inputs = { };

  outputs = { self }: {
    catppuccin = {
      latte = self.catppuccin.hex.latte;
      frappe = self.catppuccin.hex.frappe;
      macchiato = self.catppuccin.hex.macchiato;
      mocha = self.catppuccin.hex.mocha;
      bare = import ./palette/bare.nix;
      hex = import ./palette/hex.nix;
      hsl = import ./palette/hsl.nix;
      rgb = import ./palette/rgb.nix;
      rgba = import ./palette/rgba.nix;
    };

    overlays.default = final: prev: {
      catppuccin = self.catppuccin;
    };

    homeManagerModules.default = { lib, ... }: {
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
