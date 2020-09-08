class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.391.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.391.1/snyk-macos"
    sha256 "18693e00cf69a26d5fd496a0b4c93a656e80d7dd5555ba7c9343b2d7b285c315"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.391.1/snyk-linux"
    sha256 "9da02c6dbebc07fdc7a794d5fc977e3e492755d3affd5c6fd436b8c133910320"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
