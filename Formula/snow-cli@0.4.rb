class SnowCliAT04 < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.2/snow-cli-0.4.2-aarch64-apple-darwin.tar.xz"
      sha256 "e97d01c8511b5f48090ece4ca68df873d6c89b87c42838ee51b849128e892946"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.2/snow-cli-0.4.2-x86_64-apple-darwin.tar.xz"
      sha256 "01b3abd8050daa86faa702869a9bb6049c8887e96b1bf8831c0c5bf03fc84687"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.2/snow-cli-0.4.2-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8b1c2cc1f0336bbe9a65f1278335be7a0e8792813c46166f393c1bf88d22f9bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.2/snow-cli-0.4.2-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e9afddcfb686654f6abd13ff2d2847999632e29bd55c7efda1439cdd1ca8fc8d"
    end
  end

  def install
    bin.install "snow-cli"
    bin.install "snow-cli-ro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/snow-cli --version")
  end
end
