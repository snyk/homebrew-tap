class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.332.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.332.0/snyk-macos"
    sha256 "2f0a4766c0b706f88ad8e8b0fd0c8c518aeaec56da346b71b43fb281b700e618"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.332.0/snyk-linux"
    sha256 "e5fb99daac8b6b7706f489ace9d1e4b2ebbd1c67796970f06f05fa001a687a12"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
