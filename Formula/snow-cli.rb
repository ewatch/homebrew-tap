class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.6.0/snow-cli-0.6.0-aarch64-apple-darwin.tar.xz"
      sha256 "0638a4cc7265f47fd04b465e220f623f0b6e7dfee0d16b7c1cf5d65cc90b67cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.6.0/snow-cli-0.6.0-x86_64-apple-darwin.tar.xz"
      sha256 "3d667f897634c82342ee7716e6c9b7a7cd592f433c67d66e3e66887dafa065d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.6.0/snow-cli-0.6.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "75260960e41a92f8c828cd279b84b7abda4b7efe75c088981358cdd1c7e3ca17"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.6.0/snow-cli-0.6.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ccd0abe1a508e2a530d7e120314a18288881b9ad25a4de11a7fbc51f9ee31a18"
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
