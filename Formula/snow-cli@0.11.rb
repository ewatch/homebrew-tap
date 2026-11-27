class SnowCliAT011 < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.11.0/snow-cli-0.11.0-aarch64-apple-darwin.tar.xz"
      sha256 "a358257b27d80aaa52e5c410918b0aa53e4539809b0ed2e41401a21565dab000"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.11.0/snow-cli-0.11.0-x86_64-apple-darwin.tar.xz"
      sha256 "b056a3bc5ee32e5c2fd38057870f4929a0e5b179092852cfdca74b10ed29c006"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.11.0/snow-cli-0.11.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c776a83e7b152833f6e3e9260d9207876894e7f9d4c05e5575519d84419d2609"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.11.0/snow-cli-0.11.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dbaf3a9b4076d14d153a496bb7b5ea2b0ecd6558ec47298f12698169e5b2cbac"
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
