class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1306.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.4/snyk-macos?utm_source=HOMEBREW"
    sha256 "f902dbc0be77cd3778d2a7119cc7235e220cf2ef809171b17b95e295b2e23d35"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.4/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "c9f0ef8c4b555f3ac4eb6d3d874d2d06260a58d39e91dbcac4008cfb74c9ecbb"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.4/snyk-linux?utm_source=HOMEBREW"
    sha256 "78a83f57a16cb660879cb29f75fcb4a6c1ba07791dceb41e2b840fb89741c95c"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.4/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "d970aef55c25dc3cb5986853e69643aac7e20acf8c56ffbd304218f41470a7d2"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
