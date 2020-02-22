class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.295.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.295.0/snyk-macos"
    sha256 "d3c1a330cfc7fed77cd56e66085c9abbdb8794661875ac34b93df5b0ba04691b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.295.0/snyk-linux"
    sha256 "ad8a982e643ce9bd1b8f089aefada836cd44515bd59553c1969ef239a0a48c58"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
