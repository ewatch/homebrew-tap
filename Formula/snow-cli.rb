class SnowCli < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.10.0/snow-cli-0.10.0-aarch64-apple-darwin.tar.xz"
      sha256 "9380fdc17df2ac9bab47196162a4a06154715b3c92242e4d0c0757defb36f95a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.10.0/snow-cli-0.10.0-x86_64-apple-darwin.tar.xz"
      sha256 "142bb1f25b4cb44f4f4e73bc6a9f3793229d27688b45714fa01ffac8dbe8897a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.10.0/snow-cli-0.10.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "93453869b64537e59c1a31571171860e59ed19f01a217bc41cae6567df86ec0d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.10.0/snow-cli-0.10.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0bc6f47ae2be5a5cb59f34e23521909f09e2e18ef683e7500f54dd4b61effd3f"
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
