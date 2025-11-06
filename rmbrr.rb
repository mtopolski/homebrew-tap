# Homebrew Formula for rmbrr
# This file should be submitted to homebrew-core after first stable release
# Or create your own tap: brew tap mtopolski/tap

class Rmbrr < Formula
  desc "Fast parallel directory deletion with cross-platform support"
  homepage "https://github.com/mtopolski/rmbrr"
  version "0.1.8"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-aarch64"
      sha256 "f84c4fce44ebed092d7a2fedaf7c146deb404be6f8b4fb77bc53d9b7b1966d2a"
    else
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-x86_64"
      sha256 "c2de827a25786c0244a31d5bd1c626cfc6fa2bb6f10a63223f452ece93e14860"
    end
  end

  on_linux do
    url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-linux-x86_64"
    sha256 "c2de827a25786c0244a31d5bd1c626cfc6fa2bb6f10a63223f452ece93e14860"
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
