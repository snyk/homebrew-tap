class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1301.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1301.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "62c0bf067bf5826bbf1f0aeeb0258cf45fa7e087f1019e2c543fd0727762e39b"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1301.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "314bca47ee4cabb2bdbbdac67f5349e054d22f2d11db132b92a011a839abc4af"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1301.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "7cff764785ebf965ba53cf10b746fe2ba602c127ac370e3775ed1c104569b844"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1301.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "a8cb8aebd929047d8eb211026ec1c7d101cb3335d2f42b61a04d220d9c157916"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
