# Homebrew formula for hush. Builds from source (auditable; no prebuilt binary
# to trust). Pinned to a tagged source tarball + its SHA-256, so `brew` verifies
# the download against the published checksum.
#
# Install:
#   brew install miradorlabs/tap/hush
#
# Upgrading on a new release: bump `url` to the new tag and replace `sha256`
# with `curl -L <tarball-url> | shasum -a 256`.
class Hush < Formula
  desc ".env files sealed to your Mac's Secure Enclave (Touch ID gated)"
  homepage "https://github.com/miradorlabs/hush"
  url "https://github.com/miradorlabs/hush/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5dc0b961d4068cc5beea0632f29d7a9d13a96ffb11431cc8431242d82480822a"
  license "Apache-2.0"

  depends_on xcode: ["14.0", :build]
  depends_on macos: :ventura # 13+, for the Secure Enclave APIs used

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/hush"
    # Re-assert the hardened runtime (blocks DYLD injection into hush itself).
    system "codesign", "--force", "--options", "runtime", "--sign", "-", bin/"hush"
  end

  test do
    # `help` needs no identity or prompt and prints the banner.
    assert_match "Secure Enclave", shell_output("#{bin}/hush help")
  end
end
