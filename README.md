# yazi-kgp

Package sources for [ApexGP/yazi](https://github.com/ApexGP/yazi), a fork of
[yazi](https://github.com/sxyazi/yazi) with kitty graphics protocol forwarding
for embedded terminals.

The build workflow builds prebuilt `yazi` and `ya` binaries from the `stable`
branch, publishes GitHub release assets, and updates the Homebrew formula,
Scoop manifest, and the Arch/Debian package repositories. You do not need Rust
or a local checkout.

## Homebrew (macOS / Linux)

```sh
brew tap ApexGP/yazi-kgp
brew install yazi-kgp
```

The formula installs the `yazi` and `ya` binaries. It is named `yazi-kgp` to
avoid colliding with the official `yazi` formula; uninstall the official
formula first if it is still installed. After a new release:

```sh
brew update
brew upgrade yazi-kgp
```

## Scoop (Windows)

```powershell
scoop bucket add yazi-kgp https://github.com/ApexGP/homebrew-yazi-kgp
scoop install yazi-kgp/yazi-kgp
```

The bucket manifest lives in `bucket/yazi-kgp.json`.

## Arch Linux (pacman)

Add the custom binary repository:

```ini
[yazi-kgp]
SigLevel = Optional TrustAll
Server = https://apexgp.github.io/homebrew-yazi-kgp/pacman/x86_64
```

```sh
sudo pacman -Sy yazi-kgp
```

This is a custom binary repository, not AUR. AUR packages require a separate
per-package repository.

## Debian / Ubuntu (apt)

```sh
echo "deb [trusted=yes] https://apexgp.github.io/homebrew-yazi-kgp/apt stable main" \
  | sudo tee /etc/apt/sources.list.d/yazi-kgp.list
sudo apt update
sudo apt install yazi-kgp
```

`trusted=yes` is used because this personal repository is not signed.

## Dependencies

Only prebuilt binaries are installed. The upstream formula's only build
dependency is Rust; this workflow builds on GitHub Actions instead, so Rust is
not required locally. Optional runtime tools (ffmpeg, 7zip, poppler,
imagemagick, resvg, fd, ripgrep, fzf, chafa, jq) are not installed
automatically, matching the upstream formula's behavior.
