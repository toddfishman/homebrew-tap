# Generated for v0.6.7 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  # The site, not the repo. The source repo went private on 2026-08-18, so a
  # GitHub homepage is now a 404 for every visitor and `brew audit --strict`
  # checks that this URL resolves. Installs only ever use `url`, so this was
  # never load-bearing — it is the link a human clicks from `brew info`.
  homepage "https://stowit.dev"
  version "0.6.7"
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
      sha256 "96d54ac399ed2e41d094630f19bdc5535a4e20f8b150b93ae0cedc86586dd1b5"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e3841584062f5b551203685dc0054fb6ec53aab5248513b5e35f349654bd4843"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c0a2a0f25617cbc1861b84e6fd1da01032e47ffe57b9bd5f11ef0c528cdf609"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0895dead1992b336d133a8e6b8480aa8bed4efbbf90341976697a73481ffc5f"
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
