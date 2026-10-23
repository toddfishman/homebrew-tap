# Generated for v0.6.18 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  # The site, not the repo. The source repo went private on 2026-08-18, so a
  # GitHub homepage is now a 404 for every visitor and `brew audit --strict`
  # checks that this URL resolves. Installs only ever use `url`, so this was
  # never load-bearing — it is the link a human clicks from `brew info`.
  homepage "https://stowit.dev"
  version "0.6.18"
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
      sha256 "a089bb5ba7fbb16e6fcdfbcf395f8f0fb0035fa9875fce5b44d8a7c3a02a7eaa"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "db7b9e8669a7858bd94c2f1ebcd6ef863cb3a7babdb8725cd6176dd2ca212e45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dff87a79fbe16ea268e036c1a36bb0a55955351282a5ee65e8218fd8133fcc82"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "239e1b775bf79bedf5e830b837222c856ceaa2ea68d4f6bc81830709977493df"
    end
  end

  def install
    bin.install "stowit"
  end

  def caveats
    <<~EOS
      stowit reads your disk and changes nothing until you run a command.
      Try: stowit proof ~
    EOS
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
