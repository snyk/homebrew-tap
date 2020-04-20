class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.306.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.306.0/snyk-macos"
    sha256 "d3c3395bae0eea8ab3d1179e17cfa229241629375e6b857628ad2288eaf42152"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.306.0/snyk-linux"
    sha256 "d3218bf261da6cae8c78b10fd58ce60c53376e7ac0d3fe5ea6054cacb867fd0a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
