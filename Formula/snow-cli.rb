class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "VERSION_PLACEHOLDER"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/vVERSION_PLACEHOLDER/snow-cli-VERSION_PLACEHOLDER-aarch64-apple-darwin.tar.xz"
      sha256 "ARM_MAC_PLACEHOLDER"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/vVERSION_PLACEHOLDER/snow-cli-VERSION_PLACEHOLDER-x86_64-apple-darwin.tar.xz"
      sha256 "INTEL_MAC_PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/vVERSION_PLACEHOLDER/snow-cli-VERSION_PLACEHOLDER-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "LINUX_ARM_PLACEHOLDER"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/vVERSION_PLACEHOLDER/snow-cli-VERSION_PLACEHOLDER-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "LINUX_INTEL_PLACEHOLDER"
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
