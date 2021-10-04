class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.730.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.730.0/snyk-macos"
    sha256 "fd3942ff10e68352ad2833b1e14fa72ebe88bbb5ee657108a2f396ae59b3f406"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.730.0/snyk-linux"
    sha256 "fcc32e5ca230d9dcf0149a601867bed0855148845b32c46bca601db536594dbb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
