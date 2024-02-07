class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1278.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1278.0/snyk-macos"
    sha256 "b2657a40dfd6b0f316b646934523b3f238aa0d7be5c8ccc0d7f1220dc7028961"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1278.0/snyk-macos-arm64"
    sha256 "0114cf389245170449d9513e5016de6f05008b2bcd1507ee9bf653b7723ca707"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1278.0/snyk-linux"
    sha256 "dccf03d1d893cededb5e11f1fbbb08d83c9eed4b00f5767c0d0fa29a6bd4ac3e"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1278.0/snyk-linux-arm64"
    sha256 "9e1164c8b403172869e1f3f6958b42dd7b281eaf867fe1b1b822c18fc0ac7af9"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
