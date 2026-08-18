# Generated for v0.3.0 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  homepage "https://github.com/toddfishman/stowit"
  version "0.3.0"
  # The bottle is a combined work: the core/scan/cli/attic crates are
  # MIT OR Apache-2.0, but stowit-brain (the eviction planner) is proprietary
  # and links into the same binary. There is no SPDX expression for that, and
  # `license "MIT OR Apache-2.0"` would have been a false claim about the thing
  # Homebrew actually installs. :cannot_represent is Homebrew's documented
  # escape hatch for exactly this case.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "00e264b5979678cdc1b0c4afa1a0c73f0b650ef362899e4476403e2f3b938251"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fdd900f402360ae622aeaa4daee02c16bba802eed100903b3650d5d2991f9e10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b5b95a565c8bd77dfe73feb66d96031b47208f88824d0c8999d07932e32622d"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "034280ba0ddc226b71680691910fd62671ab4d5be6072007f8b668c2d59b43e8"
    end
  end

  def install
    bin.install "stowit"
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
