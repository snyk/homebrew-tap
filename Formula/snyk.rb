class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.628.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.628.0/snyk-macos"
    sha256 "08182e00c95be88e00e4921cacfa6744831b85bb9ad8617510674ae08a9b60f9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.628.0/snyk-linux"
    sha256 "166b9ec9ee0342ae1774a6bb89860a48cfb63bcb6d4683dbcc3517c71f474478"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
