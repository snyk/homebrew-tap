class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1295.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "0c87c6a11bcc477d14c6c741c00a13ee4121b1a92650ab0dcce0daed80a22918"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "91ff687a86f5332bc293940a12b18148398b1684bc843d589d6f052797a2efed"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "4bee97c402cefb9883010ba8ce8625753e4ba5a1f5eb9379f4d87a39b049d3ec"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "dfeb55432c5842f7f1ac62ec203cccce04480be8a517c6bfa7e8b0a096fd8305"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
