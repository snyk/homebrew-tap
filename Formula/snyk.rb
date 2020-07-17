class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.362.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.362.1/snyk-macos"
    sha256 "df50bc455ecbca63cc8b63cecf3dc189b0afed60731e263dde9078d99d5b9d1d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.362.1/snyk-linux"
    sha256 "a09dc63dc89c9e9e6e1995b2794376e6b7828d119e176f55579aa286cddee232"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
