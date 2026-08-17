# Generated for v0.1.0 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  homepage "https://github.com/toddfishman/stowit"
  version "0.1.0"
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
      sha256 "9ba91e2f143baf88679bdb793b2b094b8f77a7591764e26f03ba47f807388d7a"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1b092326604221a0ab23014081e52f42df848ce35496d48ce19c0742f7a55f2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7345e8e01f28826ebc358ebc2b647f558501a30cb62a59669e743f651c9d6f8a"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3763d03632e287fc1c43c16d31459e6815a6639a86a7334050d5e5ea7cbfe294"
    end
  end

  def install
    bin.install "stowit"
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
