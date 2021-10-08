class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.733.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.733.0/snyk-macos"
    sha256 "1234a0a206999f9e6f3ec6cef8c4ac8c734b821b71a5c41e6300acfda93049fb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.733.0/snyk-linux"
    sha256 "8a6b62d9a4ee5c8fa76fb77a04f5294fb1b328fbaa6021c4fd6091536b11d482"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
