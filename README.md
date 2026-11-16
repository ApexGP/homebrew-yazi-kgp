# homebrew-yazi

Homebrew tap for [ApexGP/yazi](https://github.com/ApexGP/yazi), a fork of
[yazi](https://github.com/sxyazi/yazi) with kitty graphics protocol forwarding
for embedded terminals.

The tap workflow builds prebuilt `yazi` and `ya` binaries from the `stable`
branch, publishes them as GitHub release assets, and updates
`Formula/yazi-local.rb`. You do not need Rust or a local checkout.

## Install

```sh
brew tap ApexGP/yazi
brew install yazi-local
```

The formula installs the `yazi` and `ya` binaries. It is named `yazi-local` to
avoid colliding with the official `yazi` formula; uninstall the official formula
first if it is still installed.

## Update

The workflow checks the `stable` branch daily and rebuilds only when a new
upstream tag has been merged. After a new release:

```sh
brew update
brew upgrade yazi-local
```

## Dependencies

Only the prebuilt binaries are installed. The upstream formula's only build
dependency is Rust; this tap builds on GitHub Actions instead, so Rust is not
required locally. Optional runtime tools (ffmpeg, 7zip, poppler, imagemagick,
resvg, fd, ripgrep, fzf, chafa, jq) are not installed automatically, matching
the upstream formula's behavior.
