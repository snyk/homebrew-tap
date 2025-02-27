class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1295.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.4/snyk-macos?utm_source=HOMEBREW"
    sha256 "45a38647f76fd892be7e5782e4104972d28975d5c81b142840f985c0a0633c58"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.4/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "cf87c0d12b730d10d54e62a06d4025c1b2c5852f61aaa61fca1c3cefb7edd2ed"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.4/snyk-linux?utm_source=HOMEBREW"
    sha256 "1075bb1561775130c17879d027d7b39fecf597031bd2c12d68077e62fb7896e1"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.4/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "328b0012945d32d587d5b2aed45158ced361454c8c57b28b2d4d69e177b1155d"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
