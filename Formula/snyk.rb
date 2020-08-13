class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.373.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.373.1/snyk-macos"
    sha256 "f33b4147263aa5eb5a78fcc33ca4c30851348ffb7e81a9ebb162ccd2daeffde3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.373.1/snyk-linux"
    sha256 "6b4238c927996d076ab01330a995c27fb86a13142cbef85c7631f291c02da5a6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
