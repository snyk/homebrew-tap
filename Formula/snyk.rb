class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.364.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.364.0/snyk-macos"
    sha256 "5e0263e70dbfa25b072515b6b59b963df8540b0acfd3253a56283f3fdc3bf1bc"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.364.0/snyk-linux"
    sha256 "9d6248798bc0346e361f1632423f0dd22bba7865818dd3a02b01a93293d28f37"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
