class SnowCliAT09 < Formula
  desc "CLI gateway for LLMs and coding agents to access ServiceNow instances"
  homepage "https://github.com/ewatch/snow-cli"
  license "MIT"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.9.0/snow-cli-0.9.0-aarch64-apple-darwin.tar.xz"
      sha256 "0460fec3ccc8fd85fe7c814d9b1142e41aa29a0f16928b12c2fc480b3da4bde3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.9.0/snow-cli-0.9.0-x86_64-apple-darwin.tar.xz"
      sha256 "824d8aba79a2918e4e475cc22b8277bfea68fe08dad0c1b1f576a1997b2b780e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.9.0/snow-cli-0.9.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8f765ee64aed6aa8a94a60e9550f0778700a66b3e47413d450cad30ad748fda9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ewatch/snow-cli/releases/download/v0.9.0/snow-cli-0.9.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "63062ef4966577df88fbfe3cdd0135089dfba6b53073b3d3bf8f98f1e7f92472"
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
