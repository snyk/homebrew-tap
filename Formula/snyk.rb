class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1061.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1061.0/snyk-macos"
    sha256 "a333fd2ba26b3c9a9b3fb113d4122da3e853e0cf94f3c8046c1cdb5cbc514ee7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1061.0/snyk-linux"
    sha256 "38fc8a93f915e2e9e7f98c0aa29edf9b87e382c8e55f2f8bb40647bcc2ba1e0c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
