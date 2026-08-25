class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.8.0/snow-cli-0.8.0-aarch64-apple-darwin.tar.xz"
      sha256 "1abd7480b1e15a40beace664a50f08bd8ecfe024666e9606fe9f6a69d5bb3985"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.8.0/snow-cli-0.8.0-x86_64-apple-darwin.tar.xz"
      sha256 "654afa87b19336b9660c56fcce40416e8e0a331bb8cd64db1a7c1f34a467dd19"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.8.0/snow-cli-0.8.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d9bf3f67b822924aa6b61900bc14b9a59f693f008aa663ebdb1141f08b5b0220"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.8.0/snow-cli-0.8.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "748ad40d45d237e21c65ff2ea4aba0df2e0ad5c9f2e2e083e314d85888b7c717"
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
