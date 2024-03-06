class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1282.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1282.1/snyk-macos"
    sha256 "9135068ac0aa73cbb6265fb0759d6a3eb08d5bcd110ad0ea657c2a0a0b9eb21a"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1282.1/snyk-macos-arm64"
    sha256 "a9a7664a8c08eb557a29698be8edaa4177917c4abbe7b729c8581161e5e17994"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1282.1/snyk-linux"
    sha256 "48c3661bf9de41f1aff149ca676d57926df73e9dab85d8f6988a48019160ae01"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1282.1/snyk-linux-arm64"
    sha256 "f733e28dbbaa1744e21e0c711d9ac4f977f491aecc01f8faa8b6d0d9d31814a5"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
