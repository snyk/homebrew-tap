class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.884.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.884.0/snyk-macos"
    sha256 "f158373ecc3e5d7c1d3420b4fa0823ec17fb89107620a2f538a79ad1ef4b40e1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.884.0/snyk-linux"
    sha256 "cdb39e5681169ccd5360e1e4465ad7572de95a5db70859833a8f015720d98bea"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
