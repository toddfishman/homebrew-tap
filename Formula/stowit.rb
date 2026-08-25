# Generated for v0.6.3 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  # The site, not the repo. The source repo went private on 2026-08-18, so a
  # GitHub homepage is now a 404 for every visitor and `brew audit --strict`
  # checks that this URL resolves. Installs only ever use `url`, so this was
  # never load-bearing — it is the link a human clicks from `brew info`.
  homepage "https://stowit.dev"
  version "0.6.3"
  # The bottle is a combined work: the core/scan/cli/attic crates are
  # MIT OR Apache-2.0, but stowit-brain (the eviction planner) is proprietary
  # and links into the same binary. There is no SPDX expression for that, and
  # `license "MIT OR Apache-2.0"` would have been a false claim about the thing
  # Homebrew actually installs. :cannot_represent is Homebrew's documented
  # escape hatch for exactly this case.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3896076be79453dadaaa342e0d81ca7b2e6b8d8c8969bc0bd490edb31f15e758"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d37bcac2fb0f98a4918352a9c1d8a21740f334287b8104dfb5da24444a2ad11c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e946a84a1d1abe610aa734185857aec1ebc55c22eb65cb7fd2317b6b3d7cb44"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26fac5734fddbf9b65b3b12f6e6a8eb84540ebaebf2c1587990a945b4e6ea738"
    end
  end

  def install
    bin.install "stowit"
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
