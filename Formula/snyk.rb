class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.315.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.315.1/snyk-macos"
    sha256 "20440850176f25913a445d19ad9e5107ff7cdc5b1979cfc1e730d423cef4910e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.315.1/snyk-linux"
    sha256 "dbcb8baad8fbea8536381f30db4672e438aa3453888ef748ac3bdc62f445a1b1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
