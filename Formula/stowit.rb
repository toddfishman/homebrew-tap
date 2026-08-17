# Generated for v0.2.0 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  homepage "https://github.com/toddfishman/stowit"
  version "0.2.0"
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
      sha256 "bf1578add92817f22384063b226c1ad8e07d323d45d0cb4fecfbcb222d9805df"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6f0def4af835004606f6ec52cafed8ca2b8af87442f5574a9c85f5235a23fcc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd77ca63f6aa3a370da3cc298fcadaa259ffa665a4b16b4cf77e93537f34b5b0"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fc6588812d2e2337a465c7fc6858adf32519680ad793b28738430af7f17c15b"
    end
  end

  def install
    bin.install "stowit"
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
