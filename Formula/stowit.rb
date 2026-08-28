# Generated for v0.6.6 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  # The site, not the repo. The source repo went private on 2026-08-18, so a
  # GitHub homepage is now a 404 for every visitor and `brew audit --strict`
  # checks that this URL resolves. Installs only ever use `url`, so this was
  # never load-bearing — it is the link a human clicks from `brew info`.
  homepage "https://stowit.dev"
  version "0.6.6"
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
      sha256 "2d1ba9762de21ebd0ed183783787a0bb3a5a885f1f56494a4e398bac76c5960d"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3f0ab6fd82b5ac52cd6efa3ca0ddaf860a5a4327d531c7d50c696d64e506ccc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd6a3c9567697751a5e5bebda57fc4eb1af531cebff06e8f5971edf975db069c"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b46bcf8443f876fd06dfed172a37a4263a7384eb57623c0f74df6ed39e9f743"
    end
  end

  def install
    bin.install "stowit"
  end

  def caveats
    free_gb = if OS.mac?
      `df -g / 2>/dev/null | awk 'NR==2 {print $4}'`.strip
    end
    s = <<~EOS
      stowit reads your disk and changes nothing until you run a command.
      Try: stowit proof ~
    EOS
    if free_gb && !free_gb.empty?
      s += "\nThis Mac has #{free_gb} GB free right now.\n"
    end
    s
  end

  test do
    assert_match "stowit", shell_output("#{bin}/stowit --version")
  end
end
