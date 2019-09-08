class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.226.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.226.0/snyk-macos"
    sha256 "34bc05f23a09a1d66fd674abf886e790057231c6a6bf66727c3eb10af9645b57"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.226.0/snyk-linux"
    sha256 "06e258ed2cc9decb5a9a7b4786cb77f8a749566307d79f0dfc4d3c8945207690"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
