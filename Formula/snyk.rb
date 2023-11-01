class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1238.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1238.0/snyk-macos"
    sha256 "af248c94e63138b70a7e6cb3fdc73d3961b857ddafdef19c64e662f77b449d36"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1238.0/snyk-macos-arm64"
    sha256 "2ec37811a62d2c79451b43abcbf5e3ae22102660b1214896acb995eec5fa6c9d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1238.0/snyk-linux"
    sha256 "88d6c5288929d3270443e36091dff57aac9f15dac80ccf12145223adedf9d1fa"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1238.0/snyk-linux-arm64"
    sha256 "a242a865503a9621b25af458bb4d9a97a620d14438959d5921f5380780a5e204"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
