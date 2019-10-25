class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.238.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.238.0/snyk-macos"
    sha256 "46aab091332e8ed494f9eb77b9cadfb22f55b8d8f1294c553981270f138ad93c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.238.0/snyk-linux"
    sha256 "a9b6c35fb8b5f053a155b7d78218071d55efd8359951195a972b56e97e9710f6"
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
