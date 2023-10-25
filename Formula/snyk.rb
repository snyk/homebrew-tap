class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1237.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1237.0/snyk-macos"
    sha256 "0147bff8a9d0fe71603478d2e6f25e2b802e3ee9b9eaa90a42a65fb7f109b887"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1237.0/snyk-macos-arm64"
    sha256 "e3ae73c7f96bc9dd8c09263ab77860ba000a88354f03bc8665ef31a3c3c9c916"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1237.0/snyk-linux"
    sha256 "9d118c064cd46a8b9777425098be40fc6a05a0fcd27be2e6ffb7358de4bb8bc3"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1237.0/snyk-linux-arm64"
    sha256 "1e5cf83625311559e75faa1ae4abdff1ca5063e95d7532dae6736ac174c7104e"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
