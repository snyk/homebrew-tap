class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1304.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "cf177235dbc7d11b52a4120336b67ddea306cfd7eb845842d25ff1bab727dc10"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "c7f587c31464e2fb3df00fa54e214fbf1305de9612be766ac331329cb6412bca"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "e175f909a4b6f9158985d9603e581a5736ae70546ecb52746dc32fd9575cd920"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "3a9429391c800b2b02b6385522737f55aee367c8f5c6f9bd26da3f10398068bf"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
