class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.922.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.922.0/snyk-macos"
    sha256 "8f1bf4ede5e3b1d53cf44a69d624ba73708d44e51a70f35e5631433467fdd815"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.922.0/snyk-linux"
    sha256 "7f503b54aee9fcbe3403c43689fb3f48819c34908359b33d96251e08dbd34931"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
