# Generated for v0.3.1 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  homepage "https://github.com/toddfishman/stowit"
  version "0.3.1"
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
      sha256 "a500d83ec2e0fb77fbd10b7c264bcc80e03037928eda71d5faa00b1fe8263857"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "299d41baa98277d79f05aed3c0a9f8ee34edd2a4502261ea0e82c565a3f7c431"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95e873cc4f6c4e86c9a10676a3d1230ced743b8b4517d27015d4dace481e67e9"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4840c0002576583c8311baa3e72ee809bd5d1daf156846c7cdcbb33c4b858a3b"
    end
  end

  def install
    bin.install "stowit"
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
