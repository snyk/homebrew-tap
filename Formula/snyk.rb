class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1301.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1301.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "b8e62daca533e55a88e9f28cbf9a83aba4cd0d91853490622f33a165d967cb88"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1301.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "f361460745f4178e166997360ec12f54f5fb25a8dfca62df93daf0ddfcb736dd"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1301.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "f870a616bc3c5bea19b23da0552f3cd7d96a8182c49c544023846091783449e9"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1301.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "d8e4e54880b9dc78f86c65c09dec953440850a6d9c38b7ba4ff7d7cd883d08c8"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
