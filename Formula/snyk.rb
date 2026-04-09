class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1304.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "4b9d19ba717efc000b7d226988c9cfa40a24cf73ad936cad6ea44f2a2c212058"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "1bcbcb539ef795b14a409f6bc77a9989997f69ad82a8e6c52cb3c4c600be6454"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "bb2b71fe8506aeafa83dac46f118d2c21b5a25cef9a05a853a824acf0e2e8c48"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "a65ffb16f9844146191450b71ee42aa664b66e47ac60a6c738b981851390bf1b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
