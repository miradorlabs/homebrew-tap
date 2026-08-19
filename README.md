# miradorlabs/homebrew-tap

Homebrew packages from [Mirador Labs](https://github.com/miradorlabs).

```sh
brew tap miradorlabs/tap
brew trust miradorlabs/tap
```

Homebrew requires third-party taps to be trusted before it will load them, since
formulae and casks are executable Ruby. `brew trust` records this once, in
`~/.homebrew/trust.json`; without it Homebrew reports the tap as untrusted rather
than installing from it.

## Packages

| | Install | What it is |
|---|---|---|
| **mirador** | `brew install miradorlabs/tap/mirador` | Command-line client for the Mirador API — query traces, logs, metrics and dashboards, and manage them as files |
| **hush** | `brew install miradorlabs/tap/hush` | `.env` files sealed to your Mac's Secure Enclave, gated by Touch ID |

### mirador

A prebuilt, statically linked binary for macOS and Linux, on both Intel and Apple
silicon. Released from
[miradorlabs/mirador-cli](https://github.com/miradorlabs/mirador-cli), where
`Casks/mirador.rb` is written automatically by GoReleaser on each tagged release —
edit it there, not here.

Shell completions for bash, zsh and fish are installed with it. Get started with:

```sh
mirador login
```

### hush

Builds from source — no prebuilt binary to trust — pinning each release to a tagged
source tarball and its SHA-256. macOS Ventura (13+) only, for the Secure Enclave
APIs. Released from [miradorlabs/hush](https://github.com/miradorlabs/hush).

## Layout

```
Casks/      prebuilt binaries   (mirador)
Formula/    built from source   (hush)
```

Both directories are served by the same `brew tap miradorlabs/tap`; Homebrew picks
the right one by name, so nothing here needs to be installed differently.
