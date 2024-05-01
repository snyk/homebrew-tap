class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1291.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1291.0/snyk-macos"
    sha256 "22795701333e7868aa2ef1f1d1307a8e6a776e64d79425f6ff350d4107263da1"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1291.0/snyk-macos-arm64"
    sha256 "c966c13ac59398014636f9c3cc81f3863398b79ea1c01840932d35cd36655c7e"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1291.0/snyk-linux"
    sha256 "8f0469b01ef00d0fad6ce6f16d6e3e502311b1bfa5bd2b058f5ec5a83e6668cd"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1291.0/snyk-linux-arm64"
    sha256 "d9a237ce55904a74d4d7e752d99689c9799ecb673b20d5988a96f62bbfac7ff5"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
