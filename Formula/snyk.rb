class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1305.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1305.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "4f2ebe0e73ba1761d62b2a3540db480b286123769906718de26a460965486900"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1305.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "0309b81edb12fe67546c9f44f340b5c26287c7f0475aacb23645961865260aff"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1305.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "5f65f787a1c66eed4afe1abca08ac0b1435dfdd3a7a3c7e00b66e07ad6d269c3"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1305.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "3a0fbcedb5434ce92907d396d946a69b09a05a14e0f297923a44135adbf52245"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
