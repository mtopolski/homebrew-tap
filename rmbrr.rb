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
      sha256 "9f38eb170250901a468bb441d7ae1b8afc651e6ff3c1b04eaf4d0681490e54e2"
    else
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-x86_64"
      sha256 "d6a0d649f681ee96ab217ba5a4907c16a10f3162dab5076a8d394f3796ea1eb0"
    end
  end

  on_linux do
    url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-linux-x86_64"
    sha256 "d6a0d649f681ee96ab217ba5a4907c16a10f3162dab5076a8d394f3796ea1eb0"
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
