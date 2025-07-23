# Catppuccin for Nix.

## Usage

```nix
{
  inputs.catppuccin.url = "github:abhinandh-s/catppuccin-flake";

  outputs = { self, nixpkgs, ... }: @ inputs {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      ...
  };
}
```

Then in your `configuration.nix`

```nix
{ inputs, ... }: {

  nixpkgs.overlays = [
    inputs.catppuccin.overlays.default
  ];
}
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