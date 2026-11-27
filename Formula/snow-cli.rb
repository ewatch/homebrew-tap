class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.12.0/snow-cli-0.12.0-aarch64-apple-darwin.tar.xz"
      sha256 "6dcd190c190b926bc3696e02c65c6a6bc0c022d542e7b11e295fec97859a8419"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.12.0/snow-cli-0.12.0-x86_64-apple-darwin.tar.xz"
      sha256 "88b7bc7260061d8bf3a07e1149f9778b3d11c0bab2c66a152934b97c94f925f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.12.0/snow-cli-0.12.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dd2789fd51debb68cdce97e5efbcd6ece13f062add89f93d3d3c8e2b37920e36"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.12.0/snow-cli-0.12.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "93aacae62bb15950df3a80be4039de26b81e6dcc5308487b6582b10c48a6b5a3"
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
