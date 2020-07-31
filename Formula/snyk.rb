class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.369.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.369.2/snyk-macos"
    sha256 "cc7c2e02c809dd2b5ce3bede42b6264ba8a464e6c9e09eba0d50716bdb9c6ba3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.369.2/snyk-linux"
    sha256 "6f4bd0af59a545d3abcbc7390a35f0bb5c68f0a33498d62a13b25a948565a6b9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
