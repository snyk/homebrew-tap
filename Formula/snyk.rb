class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.783.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.783.0/snyk-macos"
    sha256 "6a833cefe005430960917da749807dfaa977d92e81ffb55ed3bea91fc712aa77"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.783.0/snyk-linux"
    sha256 "f79dfbd09da76d17e88635f8d5aeb65ec7250f00b163926f428886ec67071654"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
