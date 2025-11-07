# Homebrew Formula for rmbrr
# This file should be submitted to homebrew-core after first stable release
# Or create your own tap: brew tap mtopolski/tap

class Rmbrr < Formula
  desc "Fast parallel directory deletion with cross-platform support"
  homepage "https://github.com/mtopolski/rmbrr"
  version "0.1.11"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-aarch64"
      sha256 "e57bee74014aa7ab99b8021f1162c7dbd71f8e777c48c98bdde122367d487a27"
    else
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-x86_64"
      sha256 "a0f37d9ac6db406b29162bb781148e7d41e3d6d387863dd368799913239a9bd1"
    end
  end

  on_linux do
    url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-linux-x86_64"
    sha256 "a0f37d9ac6db406b29162bb781148e7d41e3d6d387863dd368799913239a9bd1"
  end

  def install
    bin.install "rmbrr-macos-aarch64" => "rmbrr" if Hardware::CPU.arm?
    bin.install "rmbrr-macos-x86_64" => "rmbrr" if Hardware::CPU.intel?
    bin.install "rmbrr-linux-x86_64" => "rmbrr" if OS.linux?
  end

  test do
    system "#{bin}/rmbrr", "--version"
  end
end
