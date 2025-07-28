# Catppuccin for Nix.

## Usage 

```nix 
inputs = {
    catppuccin.url = "/home/abhi/git/catppuccin-nix";
};

outputs = { self, nixpkgs, home-manager, ... } @ inputs: { ... }
```

Then, in your `configuration.nix`:

```nix 
{ inputs, ... }: {

  nixpkgs.overlays = [
    inputs.catppuccin.overlays.default
  ];
}
```

Now, the colors are available in every nix module via `pkgs.catppuccin`:

## Example 

```nix 
{
  config,
  pkgs,
...
}:
let
   catppuccin = pkgs.catppuccin.mocha;
in 
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = catppuccin.base;
          foreground = catppuccin.text;
          dim_foreground = catppuccin.overlay1;
          bright_foreground = catppuccin.text;
        };
        cursor = { 
          text = catppuccin.base;
          cursor = catppuccin.rosewater;
        };
      };
    };
  };
}

```

## Color Formats

```nix 
let
  rgb_red   = pkgs.catppuccin.rgb.mocha.red;   # "rgb(243, 139, 168)"
  rgba_red  = pkgs.catppuccin.rgba.mocha.red 0.7;  # "rgb(243, 139, 168, 0.7)"
  hex_red   = pkgs.catppuccin.hex.mocha.red;   # "#f38ba8"
  hsl_red   = pkgs.catppuccin.hsl.mocha.red;   # "hsl(343deg, 81%, 75%)"
  bare_red  = pkgs.catppuccin.bare.mocha.red;  # "f38ba8"

  # `hex` is re-exported under `catppuccin` — i.e., we can access it as:
  hex_blue = pkgs.catppuccin.mocha.blue;       # "#89b4fa"
in
```


&nbsp;
<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
</p>
<p align="center">
	Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
</p>
<p align="center">
	<a href="https://github.com/abhinandh-s/catppuccin-nix/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>
