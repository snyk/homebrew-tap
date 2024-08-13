class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1292.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.4/snyk-macos?utm_source=HOMEBREW"
    sha256 "5d9897b6344f5eef820d6fd1894cddfcff5c9c290794a4ac1eb3d6a094812658"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.4/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "d0096ddf822c5ffe2f5d9be9cc0faace6d5b6ee015657ea486b78c4d7301a4c9"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.4/snyk-linux?utm_source=HOMEBREW"
    sha256 "3253feceeafaf703d8fe000d7f2b0a5a51d5bbc18ec655d1908f907c11fdecd5"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.4/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "eebe3358f97023d1be67ef72e230cf8d3ddcf9d35bba9c281c3feb2ff1a06207"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
