class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1171.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1171.0/snyk-macos"
    sha256 "4240c0a0c5d4cdb77d2621830eb8e32818942699b7870ac580eab6968d2bcf2d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1171.0/snyk-linux"
    sha256 "da66604148ae2373cc9fce881c4c5d334f7370f5cfadcd688b71e4795ca2153b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
