class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.683.1"

  if OS.mac?
    url "https://static.snyk.io/cli/dev/v1.683.1/snyk-macos"
    sha256 "46a9fe4415861fccba710ead9ae2016a173fd559c774b50ce049e4fbdd67c8e9"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.683.0/snyk-linux"
    sha256 "bae1b23cf512e44a31202ae27b7606228c9864fe7a4f3ccaf18cb025045bb9a8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
