class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1296.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1296.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "ef4079394e4efd6ff89138d13db57c04502df042b0023c2b273c511d9310d66c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1296.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "64d87dc4138486f99be7bc183fdc1ecbba82fed19dc30116a94861bec1e475e8"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1296.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "64c53a848713b1c14cfb363b69fff25824ae828942b8d754983d4812e44e1325"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1296.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "ef9abf1c91467c7faa0e599245bff8e38a1ec346a7e69be1dba770ea5841628d"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
