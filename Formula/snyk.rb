class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1304.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "e1a0cc72fb2c34820b548852f7a958c39550fbc89d0a3cd5a9ad5b0c0f606c03"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "34d5e5361b9fefabcd8739d6b0332ea9b5bf61844ee14d92200645d976b2e1d0"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "9a93da771dfc4eb5fdda93b32dec1d3013eb49af72db7e8408ec4cf3c7a8e307"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "7bc078339b4db675f4009257c0cb97713ff8e0c63add204200509832e3ad98b0"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
