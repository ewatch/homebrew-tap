class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.7.0/snow-cli-0.7.0-aarch64-apple-darwin.tar.xz"
      sha256 "394a45e759d55a0dd24c80b5f4bd16ef2994982e6f5fdc805b37b85c7ea9ef13"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.7.0/snow-cli-0.7.0-x86_64-apple-darwin.tar.xz"
      sha256 "29a6d2520b6c282df9d574d206df947ff88348bc56003f08482af92fb5a3684f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.7.0/snow-cli-0.7.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fd6f9a08e21d89dbc18297e465ffbe9d46b3cac6e53d988b1f452c3af6e6ced4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.7.0/snow-cli-0.7.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ba738b43e30a8102d55ec40a38484f7a0df6533de201f85bf8068e1ce505d1ef"
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
