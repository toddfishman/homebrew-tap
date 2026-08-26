# Generated for v0.6.4 by packaging/renderformula.sh in toddfishman/stowit.
# Do not edit here — the next release overwrites this file. Edit the
# template at packaging/homebrew/stowit.rb instead.

class Stowit < Formula
  desc "Storage tier for builders: frees disk space without deleting anything"
  # The site, not the repo. The source repo went private on 2026-08-18, so a
  # GitHub homepage is now a 404 for every visitor and `brew audit --strict`
  # checks that this URL resolves. Installs only ever use `url`, so this was
  # never load-bearing — it is the link a human clicks from `brew info`.
  homepage "https://stowit.dev"
  version "0.6.4"
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
      sha256 "d649e8b7785aa09c6977bc58972ab00ee758946ea73d4bc61563ec3e9e49e7ff"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b40c42f3a79dd68a8069a5e49016b4feb298105605ce709903e20ca11609806f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d86c72ba937c47ce98ace642366c5a8273abb1256e1c7132957de92135d9030"
    end
    on_intel do
      url "https://github.com/toddfishman/stowit-releases/releases/download/v#{version}/stowit-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d3c430ab8cb24f1fff237db061bf9463e8b83be3ec0c0d1ba8b5d2e4f74044e"
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
