# Homebrew Formula for rmbrr
# This file should be submitted to homebrew-core after first stable release
# Or create your own tap: brew tap mtopolski/tap

class Rmbrr < Formula
  desc "Fast parallel directory deletion with cross-platform support"
  homepage "https://github.com/mtopolski/rmbrr"
  version "0.1.9"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-aarch64"
      sha256 "ec70753ff426038aeb34b2b45c53eefec04a069dc82b0e5404d3cf7027c23636"
    else
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-x86_64"
      sha256 "e50771b723a98cfed1d469fa2aaac724c3f38a337e309c6893d626b1836258e1"
    end
  end

  on_linux do
    url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-linux-x86_64"
    sha256 "e50771b723a98cfed1d469fa2aaac724c3f38a337e309c6893d626b1836258e1"
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
