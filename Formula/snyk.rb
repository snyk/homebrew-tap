class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1276.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1276.0/snyk-macos"
    sha256 "00c7f96ce389cff3f79e920ba345efef2ab78f80ffebd8922082dfca07ed3af0"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1276.0/snyk-macos-arm64"
    sha256 "691b455a8fdcfb31089ca460658d060b51c58b2e37dc757e8b5434ca0a9b80cf"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1276.0/snyk-linux"
    sha256 "4ade26062f3631bf04ca6a75a7c560752585d2aed025a6a4be97517dbb4701ce"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1276.0/snyk-linux-arm64"
    sha256 "c26cc7e49354c24d4eeaec41445c612f3b93ad782482fbf9f7d38947815f01a8"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
