class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.986.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.986.0/snyk-macos"
    sha256 "2ff6ac546e0ce713bc5bcb075a76b456fe7da10a15cb14aee08172c7f519e7d2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.986.0/snyk-linux"
    sha256 "3f67f7a084a598ffe512cbf659b80212a74e05a5609688c641e0db6ffdcdf4b8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
