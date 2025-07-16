class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1298.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "8f0b773e9d295a2042082e97e28ad5b30e87c241249c520df3e87597e68b985f"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "d15aa5342d7a5eea78ce7cd62284d5101c03d9df63ca6f755fb4f57a27cd8beb"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "c9b669198762ce958c01f87f04318c35e68ccf617d53a21f25a2e392829b4767"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "fcb839617f8da52e191400de71fd0f040bab22ce96d291ffd21790ea35da6fd5"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
