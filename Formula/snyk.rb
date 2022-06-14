class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.949.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.949.0/snyk-macos"
    sha256 "3b220795260f17ae8f12d8ffd60e24c80a31f3dea0d622bc046140a27968ead0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.949.0/snyk-linux"
    sha256 "810a05a1c8afb0c9a5c3a803cb1330d051a6cd7f18cc418bde3d149ff8287115"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
