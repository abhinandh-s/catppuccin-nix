{
  description = "A flake for Catppuccin color palette";

  inputs = {};

  outputs = {self}: let
    rgb_attr = import ./palette/rgb_attr.nix;
    toRgba = color: alpha: "rgba(${toString color.r},${toString color.g},${toString color.b},${toString alpha})";
    toRgb = color: "rgb(${toString color.r},${toString color.g},${toString color.b})";
  in {
    catppuccin = {
      bare = import ./palette/bare.nix;
      hex = import ./palette/hex.nix;
      hsl = import ./palette/hsl.nix;
      latte = self.catppuccin.hex.latte;
      frappe = self.catppuccin.hex.frappe;
      macchiato = self.catppuccin.hex.macchiato;
      mocha = self.catppuccin.hex.mocha;
    };

    overlays.default = final: prev: let
      rgbaify = colors: prev.lib.mapAttrs (_name: color: alpha: toRgba color alpha) colors;
      rgbify = colors: prev.lib.mapAttrs (_name: color: toRgb color) colors;
    in {
      catppuccin = {
        inherit (self.catppuccin) latte frappe macchiato mocha bare hex hsl;
        rgb = prev.lib.mapAttrs (_flavor: palette: rgbify palette) rgb_attr;
        rgba = prev.lib.mapAttrs (_flavor: palette: rgbaify palette) rgb_attr;
      };
    };

    homeManagerModules.default = {lib, ...}: let
      rgbify = colors: lib.mapAttrs (_name: color: toRgb color) colors;
      rgaify = colors: lib.mapAttrs (_name: color: alpha: toRgba color alpha) colors;
      default = {
        inherit (self.catppuccin) latte frappe macchiato mocha bare hex hsl;
        rgb = lib.mapAttrs (_flavor: palette: rgbify palette) rgb_attr;
        rgba = lib.mapAttrs (_flavor: palette: rgaify palette) rgb_attr;
      };
    in {
      options.catppuccin = lib.mkOption {
        type = lib.types.attrs;
        readOnly = true;
        inherit default;
        description = "Catppuccin color palette";
      };
      config = {};
    };
  };
}
