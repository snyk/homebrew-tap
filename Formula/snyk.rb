class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.310.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.310.0/snyk-macos"
    sha256 "275983afb37a6946fb47bbcac19bfb8f048b69b9f73e9e0a542c5ddd94c19132"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.310.0/snyk-linux"
    sha256 "77f7d87f8c9b9f33e0236279fca21aee1557e240feec82d3361d57767b5d9c0e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
