class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.803.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.803.0/snyk-macos"
    sha256 "6ad55d4173d18f242cb0abcffff2481c6dc17d2445addc65db2c78f0bbf037ff"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.803.0/snyk-linux"
    sha256 "41899e0cfcad7e9358703c58461866c4fbb2d8715be529df31929a4d4dbf58ba"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
