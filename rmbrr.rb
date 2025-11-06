# Homebrew Formula for rmbrr
# This file should be submitted to homebrew-core after first stable release
# Or create your own tap: brew tap mtopolski/tap

class Rmbrr < Formula
  desc "Fast parallel directory deletion with cross-platform support"
  homepage "https://github.com/mtopolski/rmbrr"
  version "0.1.7"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-aarch64"
      sha256 "33f53ceb9e5728a699563e392c31bbfbc8eb8fdd9be8ca442dbf324b9434a748"
    else
      url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-macos-x86_64"
      sha256 "0ade300a73772a0a9eb696e65080101d9ded154c968ca9308047394f3d719f77"
    end
  end

  on_linux do
    url "https://github.com/mtopolski/rmbrr/releases/download/v#{version}/rmbrr-linux-x86_64"
    sha256 "0ade300a73772a0a9eb696e65080101d9ded154c968ca9308047394f3d719f77"
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
