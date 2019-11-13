class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.245.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.245.0/snyk-macos"
    sha256 "1b39ad12fc441b146524fde0160e08a5f9ec80c28fc36ab0e3e8178f4ffcae40"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.245.0/snyk-linux"
    sha256 "c52f5278a4c08be1dc5f3e07db76d60b68d185dcac3784f723d9f6462cb755ac"
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
