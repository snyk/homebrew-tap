class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.235.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.235.1/snyk-macos"
    sha256 "418ac1f3a18f21a56306821a68d03c0c7ef9ef7247bd45b091e682fb863fb664"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.235.1/snyk-linux"
    sha256 "2d594e00d2b823d5253a7b950d8a477e358dcd6773455daa623fad0f149d9fc4"
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
