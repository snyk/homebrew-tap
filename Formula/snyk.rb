class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.252.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.252.0/snyk-macos"
    sha256 "2f33924e601d8e4829a5c4ce6d7bc831cc0f0837956500998f52933ff6e2b9f7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.252.0/snyk-linux"
    sha256 "3799926b02817492d054614718ba4639b9b2c6e700962e0191eb0c38af5ecbfc"
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
