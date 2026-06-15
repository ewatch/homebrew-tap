class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.0/snow-cli-0.4.0-aarch64-apple-darwin.tar.xz"
      sha256 "PLACEHOLDER_CHECKSUM_APPLE_SILICON"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.0/snow-cli-0.4.0-x86_64-apple-darwin.tar.xz"
      sha256 "PLACEHOLDER_CHECKSUM_INTEL_MAC"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.0/snow-cli-0.4.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "PLACEHOLDER_CHECKSUM_LINUX_ARM64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.4.0/snow-cli-0.4.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "PLACEHOLDER_CHECKSUM_LINUX_X86_64"
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
