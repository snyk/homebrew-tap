class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1118.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1118.0/snyk-macos"
    sha256 "6595f4c481c9173dacc5d3bd72af7d6dd8be68a64d1554db15946bd926d2459c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1118.0/snyk-linux"
    sha256 "e597501e86d3a7393f4fca544155473c479fb940a66a37a48db17805bea12885"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
