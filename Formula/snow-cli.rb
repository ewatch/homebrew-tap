class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.5.1/snow-cli-0.5.1-aarch64-apple-darwin.tar.xz"
      sha256 "7285d692922240c441c386f1a56eaa06d1b768a5c7624f56044c6eeb01190ddd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.5.1/snow-cli-0.5.1-x86_64-apple-darwin.tar.xz"
      sha256 "d068c59e4923251ac73883a9469d6722770b703371cc0d619a9c07b2f10a307a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.5.1/snow-cli-0.5.1-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e3b16189c5b7ee36ceac0d911c1123fba13602b80330815a9a57c6cf129c23fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.5.1/snow-cli-0.5.1-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5e3a03e5fec0ae22feca3a2447d8fddbab4af5b7ba2656d0ee9218df644b0bbb"
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
