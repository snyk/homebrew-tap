class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.735.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.735.0/snyk-macos"
    sha256 "449bf42c29bac508d835360b38d224962fa7538ac7469534f7e77f9007fc0cef"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.735.0/snyk-linux"
    sha256 "1a69f0cdd081f5324878893c10c07d5724cd3c91dd3cc712199b7fe2671ae2d9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
