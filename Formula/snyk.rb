class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1302.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1302.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "1b1b3a5da821e2cb30e920f9c6dc1aed122505cc9527d436afcc6e36e18b4633"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1302.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "552bdcb4e3311d48052b2ea6ab1802e7392b210aacf300a68c67297b90273d64"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1302.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "23a12b02bbe5724406b9db0ac9da632aa78fda6d6146173f14b87a99cecf401f"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1302.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "ce89cb11f47d8593d280fa80a619e2a2d5256705bd2f6e6541befdbd8971eb39"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
