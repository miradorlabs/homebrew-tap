# miradorlabs/homebrew-tap

Homebrew tap for [**hush**](https://github.com/miradorlabs/hush) — `.env` files
sealed to your Mac's Secure Enclave, gated by Touch ID.

```sh
brew install miradorlabs/tap/hush
```

The formula builds from source (no prebuilt binary to trust) and pins each
release to a tagged source tarball plus its SHA-256. macOS Ventura (13+) only,
for the Secure Enclave APIs.
