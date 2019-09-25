class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.228.5"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.228.5/snyk-macos"
    sha256 "36ca86b85e0bf0744aaa09138225e87237be40e7ef7f744083aa48633dfb1fa5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.228.5/snyk-linux"
    sha256 "0aa293a749d3923f5e9e906209ad27622af9d2e98b6e424b0877778f9e44bee8"
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
