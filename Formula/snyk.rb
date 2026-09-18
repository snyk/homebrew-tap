class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1307.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "44c71ec3fd11f06c4aa87e77aabfd73c7cdc5822a7c9aa223c18cdae16a805b5"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "70ac5a3df7b63555e6c1894ec118a89683d51d98071f83a829924cac0fbbbbd8"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "36fd42eab22ca275bddd2a67c83b51efc358dc2c29dcf53f7a98d3797c93c621"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "4f91cfc09204403f2cfa05e9ee5dfa044c24ce78b75220437f86243a32e5317e"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
